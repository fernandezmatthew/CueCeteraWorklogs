# https://www.youtube.com/watch?v=uL-wCzVMPsc&ab_channel=Keith%2CtheCoder used as reference

from PIL import Image, ImageOps
import cv2
import os

video = cv2.VideoCapture("videos/MattEmotions.mp4")

try:
    if not os.path.exists('frames'):
        os.makedirs('frames')
except OSError:
    print("Error with creating directory")

length = int(video.get(cv2.CAP_PROP_FRAME_COUNT))
currentFrame = 0
if not os.path.exists('frames/0.png'):
    while currentFrame < length:
        ret, frame = video.read()

        if ret:
            name = 'frames/' + str(currentFrame) + '.png'
            cv2.imwrite(name, frame)
            currentFrame += 1

# pre-open all the possible thumb images
blueThumb = Image.open("thumbs/blueThumb.png")
greenThumb = Image.open("thumbs/greenThumb.png")
redThumb = Image.open("thumbs/redThumb.png")
neutralThumb = Image.open("thumbs/neutralThumb.png")

# inititalize our padding data
widthPadding = None
heightPadding = None
padding = None
pasteCoord = None
for i in range(length):
    currentFrame = Image.open("frames/" + str(i) + ".png")
    if i == 0:
        # resize all the thumbs this time only
        blueThumb = ImageOps.contain(blueThumb, (currentFrame.width // 6, currentFrame.height // 6))
        greenThumb = ImageOps.contain(greenThumb, (currentFrame.width // 6, currentFrame.height // 6))
        redThumb = ImageOps.contain(redThumb, (currentFrame.width // 6, currentFrame.height // 6))
        neutralThumb = ImageOps.contain(neutralThumb, (currentFrame.width // 6, currentFrame.height // 6))
        # define our padding data this time only
        widthPadding = currentFrame.width // 35
        heightPadding = currentFrame.height // 35
        padding = (widthPadding + heightPadding) // 2
        pasteCoord = (currentFrame.width - blueThumb.width - padding, currentFrame.height - blueThumb.height - padding)

    # use the info from the model or from the front end to find the current thumb for this frame
    # to prototype, look at video and find the times to change the timestamp
    currentThumb = blueThumb

    currentFrame.paste(currentThumb, pasteCoord, currentThumb.convert('RGBA'))  # the last arg gives transparency
    currentFrame.save("classifiedFrames/" + str(i) + ".png")

# we have officially split our video into frames and classified each frame. The last step is to
# stitch the frames back together and save as an mp4 with the original frame rate and sound

