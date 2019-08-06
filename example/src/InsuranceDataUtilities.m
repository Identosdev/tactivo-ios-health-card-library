/*
 * Copyright (c) 2018 Identos GmbH
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the Precise Biometrics AB nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
 * THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 *
 */

#import "InsuranceDataUtilities.h"

@implementation InsuranceDataUtilities

+ (NSArray*)insuranceToArray:(PBInsuranceData*)insuranceData {
    NSMutableArray* array = [[NSMutableArray alloc] init];
    [self addItemTo:array withTitle:@"Start date" andValue:insuranceData.startDate];
    [self addItemTo:array withTitle:@"Expiry date" andValue:insuranceData.expiryDate];
    [self addItemTo:array withTitle:@"Insurant type" andValue:insuranceData.insurantType];
    [self addItemTo:array withTitle:@"WOP" andValue:insuranceData.wop];
    
    return array;
}

+ (NSArray*)providerToArray:(PBProvider*)provider {
    if (provider == nil) {
        return nil;
    }
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    [self addItemTo:array withTitle:@"Name" andValue:provider.name];
    [self addItemTo:array withTitle:@"Identifier" andValue:provider.identifier];
    [self addItemTo:array withTitle:@"Country code" andValue:provider.countryCode];
    
    return array;

}

+ (NSArray*)reimbursementToArray:(PBReimbursement*)reimbursement {
    if (reimbursement == nil) {
        return nil;
    }
    
    NSMutableArray* array = [[NSMutableArray alloc] init];

    [self addItemTo:array withTitle:@"Medical treatment" andValue:reimbursement.medicalTreatment];
    [self addItemTo:array withTitle:@"Dental treatment" andValue:reimbursement.dentalTreatment];
    [self addItemTo:array withTitle:@"Inpatient area" andValue:reimbursement.inpatientArea];
    [self addItemTo:array withTitle:@"Authorized services" andValue:reimbursement.authorizedServices];

    return array;
}

+ (void)addItemTo:(NSMutableArray*)array withTitle:(NSString*)title andValue:(NSString*)value {
    if (value != nil) {
        [array addObject:@[title, value]];
    }
}

@end
