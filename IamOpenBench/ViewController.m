//
//  ViewController.m
//  IamOpenBench
//
//  Created by Vitor Alano on 2/11/13.
//  Copyright (c) 2013 Ufpel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize labelBenchmarkName;
@synthesize labelCompQuality;
@synthesize sliderCompQuality;
@synthesize labelCompQualityValue;
@synthesize index;
@synthesize sizeOfbenchmarks;
@synthesize benchmarks;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    benchmarks = [[NSArray alloc] initWithArray:[NSArray arrayWithObjects:@"Jpeg Compression",@"Pi Gauss–Legendre",nil]];
    index = [NSNumber numberWithInt:0];
    sizeOfbenchmarks = [NSNumber numberWithInt:2];;
    [self loadBenchmark:labelBenchmarkName];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLabelBenchmarkName:nil];
    [self setLabelCompQuality:nil];
    [self setSliderCompQuality:nil];
    [self setLabelCompQualityValue:nil];
    //[self setImageViewComp:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)loadBenchmark:(UILabel *)label
{
    if ([label.text isEqualToString:@"Jpeg Compression"]) {
        [self.labelCompQuality setHidden:NO];
        [self.labelCompQualityValue setHidden:NO];
        [self.sliderCompQuality setHidden:NO];
        [self.sliderCompQuality setMaximumValue:1];
        [self.sliderCompQuality setMinimumValue:0];
        [self.sliderCompQuality setValue:0.9];
        [self.labelCompQuality setText:@"Quality"];
        [self.labelCompQualityValue setText:@"0.9"];
    }
    if ([label.text isEqualToString:@"Pi Gauss–Legendre"]) {
        [self.sliderCompQuality setMaximumValue:100];
        [self.sliderCompQuality setMinimumValue:1];
        [self.sliderCompQuality setValue:1];
        [self.labelCompQuality setText:@"Loops"];
        [self.labelCompQualityValue setText:@"1"];
    }
}

- (IBAction)sliderCompValueChanged:(UISlider*)sender {
    if ([self.labelBenchmarkName.text isEqualToString:@"Jpeg Compression"]) {
        [self.labelCompQualityValue setText:[NSString stringWithFormat:@"%.02f",self.sliderCompQuality.value]];
    }
    if([self.labelBenchmarkName.text isEqualToString:@"Pi Gauss–Legendre"]){
        int num = (int)self.sliderCompQuality.value;
       [self.labelCompQualityValue setText:[NSString stringWithFormat:@"%d",num]]; 
    }
    
}

- (IBAction)nextBenchmark:(id)sender {
    int ind = [index intValue];
    int size = [sizeOfbenchmarks intValue];
    if (ind+1 != size) {
        [self.labelBenchmarkName setText:[benchmarks objectAtIndex:ind+1]];
        index = [NSNumber numberWithInt:ind+1];
        [self loadBenchmark:labelBenchmarkName];
    }
}

- (IBAction)previousBechmark:(id)sender {
    int ind = [index intValue];
    if (index != 0) {
        [self.labelBenchmarkName setText:[benchmarks objectAtIndex:ind-1]];
        index = [NSNumber numberWithInt:ind-1];
        [self loadBenchmark:labelBenchmarkName];
    }
}

- (IBAction)run:(id)sender {
    if ([self.labelBenchmarkName.text isEqualToString:@"Jpeg Compression"]) {
        JpegCompressor *compressor = [[JpegCompressor alloc] init];
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *num = [f numberFromString:[self.labelCompQualityValue text]];
        float quality = [num floatValue]; 
        UIImageWriteToSavedPhotosAlbum([compressor compressImageAt:@"MARBLES" WithQuality:quality], self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        UIImageWriteToSavedPhotosAlbum([compressor compressImageAt:@"XING_T24" WithQuality:quality], self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        UIImageWriteToSavedPhotosAlbum([compressor compressImageAt:@"G32D" WithQuality:quality], self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        UIImageWriteToSavedPhotosAlbum([compressor compressImageAt:@"FLAG_T24" WithQuality:quality], self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        UIImageWriteToSavedPhotosAlbum([compressor compressImageAt:@"CCITT_7" WithQuality:quality], self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        UIAlertView* mes=[[UIAlertView alloc] initWithTitle:@"Jpeg Compression" message:@"Images were saved in galery" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        
        [mes show];
        
        [mes release];
    }
    
     if ([self.labelBenchmarkName.text isEqualToString:@"Pi Gauss–Legendre"]) {
         PiGaussLegendre *gauss = [[PiGaussLegendre alloc] init];
         NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
         [f setNumberStyle:NSNumberFormatterDecimalStyle];
         NSNumber *num = [f numberFromString:[labelCompQualityValue text]];
        double pi = [gauss piWithIterations:[num intValue]];
         UIAlertView* mes=[[UIAlertView alloc] initWithTitle:@"Pi Gauss–Legendre" message:[NSString stringWithFormat:@"%0.16f",pi] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
         
         [mes show];
         
         [mes release];
         
     }
    
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    
    NSLog(@"Photo Saved!");
    
}
- (void)dealloc {
    [super dealloc];
}
@end
