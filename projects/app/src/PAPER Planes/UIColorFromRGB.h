//
//  UIColorFromRGB.h
//  PAPER Planes
//
//  Created by Marco Liang on 2019-11-18.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

#ifndef UIColorFromRGB_h
#define UIColorFromRGB_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#endif /* UIColorFromRGB_h */
