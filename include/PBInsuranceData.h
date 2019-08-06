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

#import <Foundation/Foundation.h>
#import "PBProvider.h"
#import "PBReimbursement.h"

/**
 * Class to represent the insurance data stored on the card.
 */
@interface PBInsuranceData : NSObject

/**
 * The insurance data as XML.
 */
@property(nonatomic) NSString* xml;

/**
 * The start date, equal to "Beginn".
 */
@property (nonatomic) NSString* startDate;

/**
 * The expiry date, equal to "EndeVersicherungsnachweis".
 */
@property (nonatomic) NSString* expiryDate;

/**
 * The provider, equal to "Kostentraeger".
 */
@property (nonatomic) PBProvider* provider;

/**
 * The settlement provider, equal to "AbrechnenderKostentraeger".
 */
@property (nonatomic) PBProvider* settlementProvider;

/**
 * The insurant type, equal to "Versichertenart".
 */
@property (nonatomic) NSString* insurantType;

/**
 * The wop, equal to "WOP".
 */
@property (nonatomic) NSString* wop;

/**
 * The reimbursement, equal to "Kostenerstattung".
 */
@property (nonatomic) PBReimbursement* reimbursement;

@end
