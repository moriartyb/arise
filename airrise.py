
import gtk
import sys
import base64
import time
import gobject
import glib
from subprocess import call
from firebase import firebase
from PIL import Image
# jpgtxt = base64.encodestring(open("in.jpg","rb").read())

# f = open("jpg1_b64.txt", "w")
# f.write(jpgtxt)
# f.close()

# # ----
# newjpgtxt = open("jpg1_b64.txt","rb").read()
count = 0

def handle_owner_change(clipboard, event):
    pass
    #global count
    #print 'clipboard.owner-change(%r, %r)' % (clipboard, event)
    #gtk.main_quit()


firebase = firebase.FirebaseApplication('https://tosstest.firebaseio.com/', None)
lastID = 0
if firebase.get('/username',None)!=sys.argv[1]:
	sys.exit()
while True:
	#print 2
	
	fireID = firebase.get('/id', None)
	#print fireID
	if not(fireID == lastID):
		image = firebase.get('/name', None)
		#print image

		filename1 = str(time.time())+".jpg"
		g = open(filename1,'w')
		g.write(base64.decodestring(image))
		g.close()
		i = Image.open(filename1)
		i.rotate(-90).save(filename1)
		
		
	#	print "Hi there"
		if firebase.get('/format',None) == 1: 
			inputImage = gtk.gdk.pixbuf_new_from_file(filename1)
			clipboard = gtk.clipboard_get()
			clipboard.connect('owner-change', handle_owner_change)
			clipboard.set_image(inputImage)
			clipboard.store()
			call(["notify-send", "--icon=gtk-add", "Arise", "'Paste from phone added to clipboard!'"])
		#call("defaults write org.macosforge.xquartz.X11 sync_clipboard_to_pasteboard -boolean true")
		#call("defaults write org.macosforge.xquartz.X11 sync_clipboard_to_pasteboard -boolean false")
		else:
			call("cp "+filename1+" ~/Pictures/arise/",shell=True)
			call(["notify-send", "--icon=gtk-add", "Arise", "Image "+filename1+" has been added to ~/Pictures/arise/"])
			#call(["rm","~/dev/mwhack/throw/"+filename1])
		#print"1"
	#gtk.main_quit()
	gobject.timeout_add(100, gtk.main_quit)
			
			
	gtk.main()
	lastID = fireID


