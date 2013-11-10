/*
 * Kobold2D™ --- http://www.kobold2d.org
 *
 * Copyright (c) 2010-2011 Steffen Itterheim. 
 * Released under MIT License in Germany (LICENSE-Kobold2D.txt).
 */

#import "HelloWorldLayer.h"

@interface HelloWorldLayer (PrivateMethods)
@end

@implementation HelloWorldLayer

-(id) init
{
	if ((self = [super init]))
	{
        /*
		glClearColor(0.1f, 0.1f, 0.3f, 1.0f);

		// "empty" as in "minimal code & resources"
		CCLabelTTF* label = [CCLabelTTF labelWithString:@"Minimal Kobold2D Project"
											   fontName:@"Arial"
											   fontSize:20];
		label.position = [CCDirector sharedDirector].screenCenter;
		label.color = ccCYAN;
		[self addChild:label];
         */
        //[self showCameraUI];
	}

	return self;
}

/*
- (void) imagePickerController:(UIImagePickerController*) picker didFinishPickingMediaWithInfo:(NSDictionary*) info
{
        NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
        UIImage *originalImage, *editedImage, *imageToSave;

        if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0) == kCFCompareEqualTo)
            {
                    editedImage = (UIImage *) [info objectForKey:UIImagePickerControllerEditedImage];
                    originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
            
                    imageToSave = editedImage != nil ? editedImage : originalImage;

                    // Save the new image (original or edited) to the Camera Roll  if the image have metadata, which means it comes from the library
                    if([info objectForKey: UIImagePickerControllerMediaMetadata] != nil)
                        {
                                NSLog(@"Saving photo in library");
                                UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
                            }

                    CGSize targetSize = imageToSave.size;
                    UIImage* resultImage = nil;

                    //Here, width and height are your size limit. The image will fit in those bounds
                    float scaleX = width/imageToSave.size.width;
                    float scaleY = height/imageToSave.size.height;
                    float scale = MIN(scaleX, scaleY);
                    if(scale != 1)
                        {
                                targetSize.width *= scale;
                                targetSize.height *= scale;
                                //hard resize because the image can be way too heavy (1536x2048 on 3GS ....)
                                resultImage = [imageToSave resizedImage:targetSize interpolationQuality:kCGInterpolationHigh]; //see vocaro.com/trevor/blog/2009/10/12/resize-a-uiimage-the-right-way/
                            }
                    else
                        {
                                resultImage = imageToSave;
                            }
                    controller.view.hidden = YES;
                    NSString* fileName = [NSString stringWithFormat:@"Documents/%@.png", saveName];
                    NSString  *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:fileName];
                    NSError* error = NULL;
                    BOOL result = [UIImagePNGRepresentation(resultImage) writeToFile:pngPath options:NSDataWritingAtomic error:&error];
                    //BOOL result = [UIImagePNGRepresentation(resultImage) writeToFile:pngPath atomically:YES];
                    NSLog(@"Write result for file %@ : %@, fullPath : %@", fileName, (result ? @"OK" : @"Problem"), pngPath);
                    if(result)
                        {
                                //Save in the Documents directory
                                CCString* fullPath = ScreateF("%s/Documents/%s.png", getenv("HOME"), [saveName UTF8String]);
                                //Remove the texture from the cache so that if you reuse a name, you'll have the new one next time you create a CCSprite with it
                                CCTextureCache::sharedTextureCache()->removeTextureForKey(fullPath->getCString());
                                //change that call by your own notification
                                notifyImagePicked([saveName UTF8String], [identifier UTF8String]);
                            }
                    else
                        {
                                NSLog(@"Write error description: %@, reason: %@", [error localizedDescription], [error localizedFailureReason]);
                            }

                    controller = [[UIImagePickerController alloc] init];
                    controller.delegate = self;
                }
        else
            {
                    NSLog(@"Problem : picked a media which is not an image");
                }
        [self imagePickerControllerDidCancel:picker];
    }

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
        // Dismiss the image selection and close the program
        [picker dismissModalViewControllerAnimated:YES];
        if(popOver)
            {
                    [popOver dismissPopoverAnimated:YES];
                }
    }
 */
@end
