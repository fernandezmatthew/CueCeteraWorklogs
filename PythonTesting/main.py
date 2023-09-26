from PIL import Image
eevee = Image.open("images/eevee.png")
# im1.save() will save the image to a new file (can change the extension here if we want
# im1.show() will display the image using idk

# we can use image.blend ONLY IF we knew the size of every frame in a video and
# converted all the thumbs to be in the bottom right corner of an image of the same size.
# kinda cringe so i dont think so

# image.composite also requires two images of the same size, and also needs a mask. kinda interpolates
# between the two images, at least in L mode for first argument.

# image.paste is what we're looking for!!!!!!!!!!! arg1 = image we want to paste to base, and
# arg2 is where we want to paste that image
thumb = Image.open("thumbs/blueThumb.png")
# lets resize our thumb to be proportional to the background image. we want to be 1/40th of the area
# can't use the thumbnail method because this wont allow us to make our thumbs larger if need be
thumb.thumbnail((eevee.width // 4, eevee.height // 4))
# let's instead paste our thumb to the bottom right of the image
pasteCoord = (eevee.width - thumb.width, eevee.height - thumb.height)
eevee.paste(thumb, pasteCoord, thumb.convert('RGBA'))

eevee.save("images/newEevee.png")
