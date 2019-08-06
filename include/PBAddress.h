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

/**
 * Class to represent an address. Equal to "PostfachAdresse" and
 * "StrassenAdresse" in "Person".
 */
@interface PBAddress : NSObject

/**
 * The postal code, equal to "Postleitzahl".
 */
@property (nonatomic) NSString* postalCode;

/**
 * The city, equal to "Ort".
 */
@property (nonatomic) NSString* city;

/**
 * The street, equal to "Strasse".
 */
@property (nonatomic) NSString* street;

/**
 * The house number, equal to "Hausnummer".
 */
@property (nonatomic) NSString* houseNumber;

/**
 * The addition, equal to "Anschriftenzusatz".
 */
@property (nonatomic) NSString* addition;

/**
 * The post box, equal to "Postfach".
 */
@property (nonatomic) NSString* postBox;

/**
 * The country code, equal to "Wohnsitzlaendercode".
 */
@property (nonatomic) NSString* countryCode;

@end
