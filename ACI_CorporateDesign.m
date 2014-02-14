//
//  ACI_CorporateDesign.m
//
//  Created by Ralph-Gordon Paul on 13.02.14.
//  Copyright (c) 2014 appcom interactive GmbH. All rights reserved.
//

#import "ACI_CorporateDesign.h"

@implementation ACI_CorporateDesign

+ (UIFont *)fontWithType:(ACI_CorporateDesignFontType)type style:(ACI_CorporateDesignFontStyle)style andSize:(CGFloat)size
{
    UIFont *font = nil;
    
    /* outer dictionary has to match the ACI_CorporateDesignFontType
     * inner dictionary has to match the ACI_CorporateDesignFontStyle
     * don't forget to add custom fonts to the Info.plist ( "Fonts provided by application" )
    */
    NSDictionary *fonts = @{
                            
                            [NSNumber numberWithInt:ACI_CorporateDesignFontTypeHelvetica] : @{
                                    
                                    [NSNumber numberWithInt:ACI_CorporateDesignFontStyleRegular] : @"Helvetica",
                                    [NSNumber numberWithInt:ACI_CorporateDesignFontStyleItalic] : @"Helvetica-Oblique",
                                    [NSNumber numberWithInt:ACI_CorporateDesignFontStyleBold] : @"Helvetica-Bold",
                                    [NSNumber numberWithInt:ACI_CorporateDesignFontStyleBoldItalic] : @"Helvetica-BoldOblique"
                                    },
                            [NSNumber numberWithInt:ACI_CorporateDesignFontTypeMenlo] : @{
                                    
                                    [NSNumber numberWithInt:ACI_CorporateDesignFontStyleRegular] : @"Menlo-Regular",
                                    [NSNumber numberWithInt:ACI_CorporateDesignFontStyleItalic] : @"Menlo-Italic",
                                    [NSNumber numberWithInt:ACI_CorporateDesignFontStyleBold] : @"Menlo-Bold",
                                    [NSNumber numberWithInt:ACI_CorporateDesignFontStyleBoldItalic] : @"Menlo-BoldItalic"
                                    }
                            };
    
    // creates the font for the given type, style and size
    NSDictionary *fontDict = [fonts objectForKey:[NSNumber numberWithInt:type]];
    
    if (fontDict != nil) {
        NSString *fontString = [fontDict objectForKey:[NSNumber numberWithInt:style]];
        font = [UIFont fontWithName:fontString size:size];
    }
    
    return font;
}

+ (UIColor *)fontColorForBackgroundColorType:(ACI_CorporateDesignColorType)type
{
    UIColor *color = nil;
    
    /* each color has the RGBA - Red, Green, Blue, Alpha
     * this dictionary has to contain the appropriate font color
     */
    NSDictionary *colors = @{
                        [NSNumber numberWithInt:ACI_CorporateDesignColorTypeYellow] : @[@0, @0, @0, @1],
                        [NSNumber numberWithInt:ACI_CorporateDesignColorTypeOrange] : @[@0, @0, @0, @1],
                        [NSNumber numberWithInt:ACI_CorporateDesignColorTypeRed] : @[@255, @255, @255, @1],
                        [NSNumber numberWithInt:ACI_CorporateDesignColorTypeDarkRed] : @[@255, @255, @255, @1],
                        [NSNumber numberWithInt:ACI_CorporateDesignColorTypeLightBlue] : @[@0, @0, @0, @1],
                        [NSNumber numberWithInt:ACI_CorporateDesignColorTypeBlue] : @[@255, @255, @255, @1],
                        [NSNumber numberWithInt:ACI_CorporateDesignColorTypeDarkBlue] : @[@255, @255, @255, @1],
                        [NSNumber numberWithInt:ACI_CorporateDesignColorTypeLightGreen] : @[@0, @0, @0, @1],
                        [NSNumber numberWithInt:ACI_CorporateDesignColorTypeDarkGreen] : @[@255, @255, @255, @1],
                        [NSNumber numberWithInt:ACI_CorporateDesignColorTypeGrey] : @[@255, @255, @255, @1],
                        [NSNumber numberWithInt:ACI_CorporateDesignColorTypeWhite] : @[@0, @0, @0, @1],
                        [NSNumber numberWithInt:ACI_CorporateDesignColorTypeBlack] : @[@255, @255, @255, @1]
                        };
    
    // creates the color for the given type
    if (colors.count > type) {
        NSArray *colorArray = [colors objectForKey:[NSNumber numberWithInt:type]];
        
        if (colorArray != nil) {
            CGFloat r = [colorArray[0] floatValue];
            CGFloat g = [colorArray[1] floatValue];
            CGFloat b = [colorArray[2] floatValue];
            CGFloat a = [colorArray[3] floatValue];
            
            color = [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
        }
    }
    
    return color;
}

+ (UIColor *)colorWithType:(ACI_CorporateDesignColorType)type
{
    UIColor *color = nil;
    
    // dictionary has to contain a RGBA - Red, Green, Blue, Alpha - for each defined color
    NSDictionary *colors = @{
                             [NSNumber numberWithInt:ACI_CorporateDesignColorTypeYellow] : @[@255, @200, @25, @1],
                             [NSNumber numberWithInt:ACI_CorporateDesignColorTypeOrange] : @[@242, @133, @2, @1],
                             [NSNumber numberWithInt:ACI_CorporateDesignColorTypeRed] : @[@196, @0, @70, @1],
                             [NSNumber numberWithInt:ACI_CorporateDesignColorTypeDarkRed] : @[@137, @13, @72, @1],
                             [NSNumber numberWithInt:ACI_CorporateDesignColorTypeLightBlue] : @[@0, @184, @242, @1],
                             [NSNumber numberWithInt:ACI_CorporateDesignColorTypeBlue] : @[@7, @120, @165, @1],
                             [NSNumber numberWithInt:ACI_CorporateDesignColorTypeDarkBlue] : @[@0, @79, @128, @1],
                             [NSNumber numberWithInt:ACI_CorporateDesignColorTypeLightGreen] : @[@116, @185, @23, @1],
                             [NSNumber numberWithInt:ACI_CorporateDesignColorTypeDarkGreen] : @[@35, @97, @78, @1],
                             [NSNumber numberWithInt:ACI_CorporateDesignColorTypeGrey] : @[@107, @117, @129, @1],
                             [NSNumber numberWithInt:ACI_CorporateDesignColorTypeWhite] : @[@255, @255, @255, @1],
                             [NSNumber numberWithInt:ACI_CorporateDesignColorTypeBlack] : @[@0, @0, @0, @1]
                             };
    
    // creates the color for the given type
    if (colors.count > type) {
        NSArray *colorArray = [colors objectForKey:[NSNumber numberWithInt:type]];
        
        if (colorArray != nil) {
            CGFloat r = [colorArray[0] floatValue];
            CGFloat g = [colorArray[1] floatValue];
            CGFloat b = [colorArray[2] floatValue];
            CGFloat a = [colorArray[3] floatValue];
            
            color = [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
        }
    }
    
    return color;
}

+ (UIColor *)colorForTheme:(ACI_CorporateDesignTheme)theme andType:(ACI_CorporateDesignThemeColorType)colorType
{
    UIColor *color = nil;
    
    /* dictionary contains the themes as keys
     * these themes contain the color types with the corresponding color
    */
    NSDictionary *themeColors = @{
                                  [NSNumber numberWithInt:ACI_CorporateDesignThemeBasic] : @{
                                          [NSNumber numberWithInt:ACI_CorporateDesignThemeColorTypeTintColor] : [NSNumber numberWithInt:ACI_CorporateDesignColorTypeBlue],
                                          [NSNumber numberWithInt:ACI_CorporateDesignThemeColorTypeLightBackgroundColor] : [NSNumber numberWithInt:ACI_CorporateDesignColorTypeWhite],
                                          [NSNumber numberWithInt:ACI_CorporateDesignThemeColorTypeMediumBackgroundColor] : [NSNumber numberWithInt:ACI_CorporateDesignColorTypeDarkBlue],
                                          [NSNumber numberWithInt:ACI_CorporateDesignThemeColorTypeDarkBackgroundColor] : [NSNumber numberWithInt:ACI_CorporateDesignColorTypeBlack]
                                 }
                             };
    
    // creates the color for the given type
    if (themeColors.count > theme) {
        NSDictionary *typeDict = [themeColors objectForKey:[NSNumber numberWithInt:theme]];
        
        if (typeDict != nil) {
            
            NSNumber *typeNumber = [typeDict objectForKey:[NSNumber numberWithInt:colorType]];
            
            if (typeNumber != nil) {
                color = [self colorWithType:typeNumber.integerValue];
            }
        }
    }
    
    return color;
}

@end
