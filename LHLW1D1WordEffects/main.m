//
//  main.m
//  LHLW1D1WordEffects
//
//  Created by Karlo Pagtakhan on 03/07/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {    
    //Variable with 255 characters
    char optionSelected[2];
    int tmp;
    int continueplaying = 1;
    char inputChars[255];
    char play[2];
    int lastCharIndex;
    NSString *lastChar = [[NSString alloc] init];
    NSString *operationSelected = [[NSString alloc] init];
    NSString *playAgain = [[NSString alloc] init];
    
    while (continueplaying == 1) {
      
      //Ask for the operation
      printf("Select an operation");
      printf("\n\t(0)Uppercase");
      printf("\n\t(1)Lowercase");
      printf("\n\t(2)Numberize");
      printf("\n\t(3)Canadianize");
      printf("\n\t(4)Respond");
      printf("\n\t(5)De-Space-It");
      printf("\nEnter the number: ");
      
      
      //Get the operation from the input
      fgets(optionSelected, 2, stdin);
      printf("You selected option %s.\n", optionSelected);
      
      operationSelected = [NSString stringWithUTF8String:optionSelected];
      
      //Flush 'Enter' key
      while ((tmp = getchar()) != '\n' && tmp != EOF);
      
      //Get the string
      printf("Enter the string: ");
      fgets(inputChars, 255, stdin);
      
      
      //Convert the string to NSString
      NSString *inputString = [NSString stringWithUTF8String:inputChars];
      NSString *resultString = [[NSString alloc] init];
      
      //Upper case
      if ([operationSelected isEqualToString:@"0"]){
        resultString = [inputString uppercaseString];
        NSLog(@"Input was %@", inputString);
        NSLog(@"The result of the operation is %@", resultString);
        
      //Lowercase
      } else if ([operationSelected isEqualToString:@"1"]){
        resultString = [inputString lowercaseString];
        NSLog(@"Input was %@", inputString);
        NSLog(@"The result of the operation is %@", resultString);
        
      //Convert to number
      } else if ([operationSelected isEqualToString:@"2"]){
        //inputString = []
        int resultNum = 0;
        
        if ([inputString rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]].location != NSNotFound){
          resultNum = inputString.intValue;
          NSLog(@"Input was %@", inputString);
          NSLog(@"Result is %d", resultNum);
        } else {
          NSLog(@"Input was %@", inputString);
          NSLog(@"Input is not a number");
        }
      
      //Canadianize
      } else if ([operationSelected isEqualToString:@"3"]){
        resultString = [inputString stringByAppendingString:@"eh!"];
        NSLog(@"Input was %@", inputString);
        NSLog(@"Result is %@", resultString);
        
      //Respond
      } else if ([operationSelected isEqualToString:@"4"]){
        /*
         If the user input ends with a question mark, answer "I don't know".
         If the input ends with an exclaimation point, respond with "Whoa, calm down!".
         */
        
        lastCharIndex = [inputString length] - 2;
        lastChar = [inputString substringWithRange:NSMakeRange(lastCharIndex, 1)];
        
        if ([lastChar isEqualToString:@"!"]){
          NSLog(@"Whoa, calm down!");
        } else if ([lastChar isEqualToString:@"?"]){
          NSLog(@"I don't know");
        }
        
      //Replace all spaces with '-'
      } else if ([operationSelected isEqualToString:@"5"]){
        resultString = [NSString stringWithString: inputString];
        resultString = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
        NSLog(@"Input was %@", inputString);
        NSLog(@"Result is %@", resultString);
        
      //Invalid operation
      } else {
        printf("\nInvalid entered operation.");
        resultString = nil;      }
      
      
      //Play again
      printf("\n\nDo you want do it again? ('Y' for yes)");
      fgets(play, 2, stdin);
      
      playAgain = [NSString stringWithUTF8String:play];
      
      if ([playAgain isEqualToString:@"Y"] || [playAgain isEqualToString:@"y"]){
        continueplaying = 1;
      } else {
        continueplaying = 0;
      }
      
      //Flush 'Enter' key
      while ((tmp = getchar()) != '\n' && tmp != EOF);
    }
    
  }
  return 0;
}
