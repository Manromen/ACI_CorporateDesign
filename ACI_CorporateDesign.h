//
//  ACI_CorporateDesign.h
//
//  Created by Ralph-Gordon Paul on 13.02.14.
//  Copyright (c) 2014 appcom interactive GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @brief Corporate Design Font Style
 @details Font style, f.e. regular, bold, ...
 @sa ACI_CorporateDesign#fontWithType:style:andSize:
 */
typedef enum {
    // if you change these, you have to adapt the fontWithType:style:andSize: method
    ACI_CorporateDesignFontStyleRegular = 0,
    ACI_CorporateDesignFontStyleItalic,
    ACI_CorporateDesignFontStyleBold,
    ACI_CorporateDesignFontStyleBoldItalic
} ACI_CorporateDesignFontStyle;

/**
 @brief Corporate Design Font Type
 @details Specifies the font type (each type is another font)
 @sa ACI_CorporateDesign#fontWithType:style:andSize:
 */
typedef enum  {
    // if you change these, you have to adapt the fontWithType:style:andSize: method
    ACI_CorporateDesignFontTypeHelvetica = 0,
    ACI_CorporateDesignFontTypeMenlo
} ACI_CorporateDesignFontType;

/**
 @brief Corporate Design Color Type
 @details Specifies the color type (yellow, orange, blue ...)
 @sa ACI_CorporateDesign#colorWithType:
 */
typedef enum {
    // if you change these, you have to adapt the colorWithType: and fontColorForBackgroundColorType: methods
    ACI_CorporateDesignColorTypeYellow = 0,
    ACI_CorporateDesignColorTypeOrange,
    ACI_CorporateDesignColorTypeRed,
    ACI_CorporateDesignColorTypeDarkRed,
    ACI_CorporateDesignColorTypeLightBlue,
    ACI_CorporateDesignColorTypeBlue,
    ACI_CorporateDesignColorTypeDarkBlue,
    ACI_CorporateDesignColorTypeLightGreen,
    ACI_CorporateDesignColorTypeDarkGreen,
    ACI_CorporateDesignColorTypeGrey,
    ACI_CorporateDesignColorTypeWhite,
    ACI_CorporateDesignColorTypeBlack
} ACI_CorporateDesignColorType;

/**
 @brief Corporate Design Theme Colors
 @details Defines some theme colors (Backgrounds, Tint, etc.). This is used to define a global theme
 @sa ACI_CorporateDesign#colorForTheme:andType:
 */
typedef enum {
    // if you change these, you have to adapt the colorForThemeType: method
    ACI_CorporateDesignThemeColorTypeTintColor = 0,
    ACI_CorporateDesignThemeColorTypeLightBackgroundColor,
    ACI_CorporateDesignThemeColorTypeMediumBackgroundColor,
    ACI_CorporateDesignThemeColorTypeDarkBackgroundColor
} ACI_CorporateDesignThemeColorType;

/**
 @brief Corporate Design Theme
 @details Using this enumerator you can support multiple themes for one app.
 @sa ACI_CorporateDesign#colorForTheme:andType:
 */
typedef enum {
    ACI_CorporateDesignThemeBasic = 0
} ACI_CorporateDesignTheme;

/**
 @brief Global Corporate Design Class
 @details Provides an interface to get all the corporate desing specific content. The content contains fonts, colors, ...
 */
@interface ACI_CorporateDesign : NSObject

/**
 @brief Corporate Design Font
 @details Generates a font matching the corporate design guidelines
 @param type The type of the Font: Sans or Serif
 @param stlye The style of the font: regular, bold, ...
 @return the generated font on success and nil on failure.
 */
+ (UIFont *)fontWithType:(ACI_CorporateDesignFontType)type style:(ACI_CorporateDesignFontStyle)style andSize:(CGFloat)size;

/**
 @brief Defines the font color for a specific background color
 @details For example should return a dark color for a light background color. Usable for always getting a clear readable fontcolor.
 @param type the color type for the background color
 @return UIColor on success and nil on failure.
 */
+ (UIColor *)fontColorForBackgroundColorType:(ACI_CorporateDesignColorType)type;

/**
 @brief Corporate Design Color
 @details Generates a UIColor matching the corporate design guidelines
 @param type The type of the Color: yellow, orange, blue ...
 @return the generated UIColor class on success and nil on failure.
 */
+ (UIColor *)colorWithType:(ACI_CorporateDesignColorType)type;

/**
 @brief Color for a theme and the corresponding type
 @details Defines the color for a theme and a type. For example the light background color for the basic theme.
 @param theme The theme to get the color for
 @param colorType The color type for the theme. For example: tint color, dark backgound color, ...
 @return UIColor on success and nil on failure.
 */
+ (UIColor *)colorForTheme:(ACI_CorporateDesignTheme)theme andType:(ACI_CorporateDesignThemeColorType)colorType;

@end
