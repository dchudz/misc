#http://visvis.googlecode.com/hg/vvmovie/images2gif.py

from mpmath import cplot, ellipfun, ellipk

def make_lattice_points(n):
	integers = range(-n,n+1)
	lattice_points = [n + m*1j for n in integers for m in integers if m != 0 or n != 0]
	lattice_points.sort(key=abs)
	return lattice_points

def make_w_term(omega):
	return lambda z: (1/(z-omega)**2) - (1/(omega**2))

def make_plots(n, rerange = [-7,7], imrange = [-7,7], numpoints = 20000, outdir = "./", n_images=25):
	first_term = lambda z: 1/(z**2)
	lattice_points = make_lattice_points(n)
	print len(lattice_points)
	print lattice_points
	#this is O(n^2) but should be O(n) if I wrote it better:
	for i in range(n_images):
		next_element = lambda z: first_term(z) + sum(make_w_term(lattice_point)(z) for lattice_point in lattice_points[0:i])
		print i
		cplot(next_element, re = rerange, im=imrange, file= outdir + "Weierstrass%03d.png" % i, points = numpoints)



#modified from code at: http://29a.ch/2009/5/14/concatenating-images-using-python
from PIL import Image
import sys
def concat_images(images_in, image_out):
	images = map(Image.open, images_in)
	w = sum(i.size[0] for i in images)
	mh = max(i.size[1] for i in images)
	result = Image.new("RGBA", (w, mh))
	x = 0
	for i in images:
		result.paste(i, (x, 0))
		x += i.size[0]
	result.save(image_out)

def concat_my_images(n_images):
	for i in range(n_images):
		image_name = "Weierstrass%03d.png" % i
		concat_images(["./zoomed_in/" + image_name, "./zoomed_out/" + image_name], "./zoomed_in_and_out/" + image_name)

if __name__=='__main__':
	
	n_images = 2
	#make_plots(6, rerange = [-7,7], imrange = [-7,7], numpoints = 20000,outdir="./zoomed_out/", n_images=n_images)
	#make_plots(6, rerange = [-1,1], imrange = [-1,1], numpoints = 20000,outdir="./zoomed_in/", n_images=n_images)

	# from os import system	
	# folders = ["zoomed_in"], "zoomed_out"]
	# for folder in folders:
	# 	system("convert -resize 50% -delay 20 -loop 0 ./" + folder + "/Weierstrass001.png " + folder + "_low_res.gif")

	from os import system	
	folder = "zoomed_in"
	dither_options = [{"option":"-dither None", "name":"no_dither.gif"}, {"option": "", "name":"default_dither.gif"}, {"option":"", "name":"many_colors.png"}]
	resolution_options = ["100","50","25"]
	for dither_option in dither_options:
		for resolution_option in resolution_options:
			command = "convert -resize " + resolution_option + "% " + dither_option["option"] + " ./zoomed_in/Weierstrass001.png ./res" + resolution_option + dither_option["name"]
			print command
			system(command)
		# system("convert  ./" + folder + "/Weierstrass001.png " + folder + ".gif")
		# system("convert -resize 25% ./" + folder + "/Weierstrass001.png " + folder + "_very_low_res.gif")
		# system("convert -resize 25% ./" + folder + "/Weierstrass001.png " + folder + "_very_low_res.png")
		# system("convert -resize 50%  -dither None ./" + folder + "/Weierstrass001.png " + folder + "_low_res_no_dither.gif")






#for resizing
# convert -resize 50% .\zoomed_in.gif zoomed_in_smaller.gif
