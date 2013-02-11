//
//  PiGaussLegendre.m
//  IamOpenBench
//
//  Created by Vitor Alano on 2/11/13.
//  Copyright (c) 2013 Ufpel. All rights reserved.
//

#import "PiGaussLegendre.h"

@implementation PiGaussLegendre

- (double)piWithIterations:(int) iterations{
    /*a0 = 1
    b0 = 1/Math.sqrt(2)
    t0 = 1/4.0
    p0 = 1
    
    puts ((a0+b0)**2)/(4*t0)
    
    i = gets.to_i
    
    while i > 0
        
        an = (a0+b0)/2
        bn = Math.sqrt(a0*b0)
        pn = 2*p0
        tn = t0 - (p0*(a0-an)**2)
        
        puts ((an+bn)**2)/(4*tn)
        
        a0 = an
        b0 = bn
        p0 = pn
        t0 = tn
        
        i = i - 1
        end */
    double a0 = 1;
    double b0 = 1/sqrt(2);
    double t0 = 1/4.0;
    double p0 = 1;
    
    int i = iterations;
    
    double an;
    double bn;
    double tn;
    double pn;
    double pi;
    
    while (i > 0) {
        an = (a0+b0)/2;
        
        bn = sqrt(a0*b0);
        pn = 2*p0;
        tn = t0 - (p0*pow((a0-an),2));
        
        pi = (pow((an+bn), 2))/(4*tn);
        a0 = an;
        b0 = bn;
        p0 = pn;
        t0 = tn;
        i--;
    }

    return (pi);
}

@end
