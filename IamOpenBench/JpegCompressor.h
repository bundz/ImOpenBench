//
//  JpegCompressor.h
//  IamOpenBench
//
//  Created by Vitor Alano on 2/11/13.
//  Copyright (c) 2013 Ufpel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JpegCompressor : NSObject
{
    NSData *imageData;
    UIImage *image;      
}

- (UIImage*)compressImageAt:(NSString*)url WithQuality:(float)quality;

@end