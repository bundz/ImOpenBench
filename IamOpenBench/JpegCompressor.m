//
//  JpegCompressor.m
//  IamOpenBench
//
//  Created by Vitor Alano on 2/11/13.
//  Copyright (c) 2013 Ufpel. All rights reserved.
//

#import "JpegCompressor.h"

@implementation JpegCompressor


- (UIImage*)compressImageAt:(NSString *)url WithQuality:(float)quality
{
    image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:url ofType:@"TIF"]];
    imageData = UIImageJPEGRepresentation(image, quality);
    NSString *jpegPath = [NSHomeDirectory()	stringByAppendingPathComponent:[url stringByAppendingString:@".jpg"]];
    [imageData writeToFile:jpegPath atomically:YES];
    return [UIImage imageWithData:imageData];
    
}


@end

