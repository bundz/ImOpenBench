//
//  ViewController.h
//  IamOpenBench
//
//  Created by Vitor Alano on 2/11/13.
//  Copyright (c) 2013 Ufpel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JpegCompressor.h"
#import "PiGaussLegendre.h"

@interface ViewController : UIViewController

/*@synthesize labelBenchmarkName;
@synthesize sliderCompQuality;
@synthesize labelCompQuality;
@synthesize labelCompQualityValue;
@synthesize imageViewComp;*/
@property (retain, nonatomic) IBOutlet UILabel *labelBenchmarkName;
@property (retain, nonatomic) IBOutlet UILabel *labelCompQuality;
@property (retain, nonatomic) IBOutlet UISlider *sliderCompQuality;
@property (retain, nonatomic) IBOutlet UILabel *labelCompQualityValue;
@property (retain, nonatomic) NSArray *benchmarks;
@property (retain, nonatomic) NSNumber *index;
@property (retain, nonatomic) NSNumber *sizeOfbenchmarks;

- (IBAction)run:(id)sender;
- (IBAction)sliderCompValueChanged:(UISlider*)sender;
- (IBAction)nextBenchmark:(id)sender;
- (IBAction)previousBechmark:(id)sender;


@end
