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

#import "ViewController.h"
#import "PBSmartcard.h"
#import "ShowHealthCardViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    accessory = [PBAccessory sharedClass];
    
    if ([accessory isConnected]) {
        [self accessoryDidConnect];
    } else {
        [self accessoryDidDisconnect];
    }
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    // Listener for accessory connection events
    [notificationCenter addObserver:self selector:@selector(accessoryDidConnect) name:PBAccessoryDidConnectNotification object:NULL];
    [notificationCenter addObserver:self selector:@selector(accessoryDidDisconnect) name:PBAccessoryDidDisconnectNotification object:NULL];
    
    PBSmartcard* smartcard = [[PBSmartcard alloc] init];
    
    healthCardController = [[PBHealthCardController alloc] initWithSmartcard:smartcard];
}

- (IBAction)readHealthCard:(id)sender {
    [self disableReadCardButton];
    [self hideError];

    [healthCardController readCard:^(PBHealthCard* healthCard, NSError* error) {
        [self performSelectorOnMainThread:@selector(enableReadCardButton) withObject:nil waitUntilDone:YES];
        
        if (healthCard == nil) {
            NSLog(@"%@", error);
            [self performSelectorOnMainThread:@selector(showError) withObject:nil waitUntilDone:NO];
            return;
        }
        
        self.healthCard = healthCard;
        
        [self performSelectorOnMainThread:@selector(showHealthCard:) withObject:healthCard waitUntilDone:NO];
    }];
}

- (void)showHealthCard:(PBHealthCard*)healthCard {
    [self performSegueWithIdentifier:@"showHealthCard" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showHealthCard"]) {
        ShowHealthCardViewController* showHealthCardViewController =  segue.destinationViewController;
        showHealthCardViewController.healthCard = self.healthCard;

    }
}

- (void)accessoryDidConnect {
    [self enableReadCardButton];
}

- (void)accessoryDidDisconnect {
    [self disableReadCardButton];
}

- (void)enableReadCardButton {
    self.readCardButton.enabled = YES;
}

- (void)disableReadCardButton {
    self.readCardButton.enabled = NO;
}

- (void)showError {
    self.errorLabel.hidden = NO;
}

- (void)hideError {
    self.errorLabel.hidden = YES;
}

@end
