//
//  Utils.h
//  BanTang
//
//  Created by EricYang on 2017/6/27.
//  Copyright © 2017年 yanyanhuyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (BOOL) isEmpty : (NSString*) str;
//创建一个自适应文字大小的UILABLE
+ (UILabel*) getAutoWrapLabel : (UIFont*) font  text : (NSString*) _text;
+ (UILabel*) getAutoWrapLabel : (UIFont*) font  text : (NSString*) _text  width : (float) _width;
+ (UILabel*) getAutoWrapLabel : (UIFont*) font  text : (NSString*) _text  size : (CGSize) _size;
//根据一个unix时间戳转换为时间格式
+ (NSString*) getFormatTime : (NSInteger) unixTimeStamp;


//创建一个自适应图片大小UIImageView
+ (UIImageView*) getAutoWrapImageView : (NSString*) imgNameNormal  imgNameHigh : (NSString*) _imgNameHigh;

+ (UIButton*) getAutoWrapButton : (UIImage*) imgNormal imgHigh: (UIImage*) _imgHigh;

//创建一个自适应图片大小的UIButton
+ (UIButton*) getAutoWrapButton : (NSString*) imgNameNormal imgNameHigh: (NSString*) _imgNameHigh text: (NSString*) _text font: (UIFont*) _font color: (UIColor*) _color;

+ (UIButton*) getAutoWrapButton : (UIImage*) imgNormal imgHigh: (UIImage*) _imgHigh text: (NSString*) _text  font: (UIFont*) _font  color : (UIColor*) _color;


//创建一个自适应图片大小的UIButton
+ (UIButton*) getAutoWrapButton : (NSString*) imgNameNormal imgNameHigh: (NSString*) _imgNameHigh;

//创建一个自动拉伸的按钮
+ (UIButton*)getAutoWrapButton:(NSString*)_imgNameNormal imgNameHigh:(NSString*)_imgNameHigh title:(NSString*)_title font:(UIFont*)_font titleColor:(UIColor*)_titleColor size:(CGSize)_size;
+ (UIButton*)getAutoWrapButton:(NSString*)_imgNameNormal imgNameHigh:(NSString*)_imgNameHigh imgDisabled:(NSString*)_imgDisabled title:(NSString*)_title font:(UIFont*)_font titleColor:(UIColor*)_titleColor size:(CGSize)_size;

+ (UIButton*)getAutoWrapButton:(UIImage*)_imgNormal imgHigh:(UIImage*)_imgHigh title:(NSString*)_title font:(UIFont*)_font titleColor:(UIColor*)_titleColor size:(CGSize)_size;
+ (UIButton*)getAutoWrapButton:(UIImage*)_imgNormal imgHigh:(UIImage*)_imgHigh imgDisabled:(UIImage*)_imgDisabled title:(NSString*)_title font:(UIFont*)_font titleColor:(UIColor*)_titleColor size:(CGSize)_size;

+ (UIButton*)getAutoWrapButtonWithTitle:(NSString*)_title font:(UIFont*)_font titleColor:(UIColor*)_titleColor height:(float)_height;
+ (UIButton*)getAutoWrapButtonWithTitle:(NSString*)_title font:(UIFont*)_font titleColor:(UIColor*)_titleColor size:(CGSize)_size;

//
+ (UIButton*)getAutoWrapButtonWithIconNormalName:(NSString*)_iconNormalName iconHighlighted:(NSString*)_iconHighlightedName size:(CGSize)_size;
+ (UIButton*)getAutoWrapButtonWithIconNormal:(UIImage*)_iconNormal iconHighlighted:(UIImage*)_iconHighlighted size:(CGSize)_size;

+ (UIButton*)get3xAutoWrapButtonWithIconNormalName:(NSString*)_iconNormalName iconHighlighted:(NSString*)_iconHighlightedName size:(CGSize)_size;
+ (UIButton*)get3xAutoWrapButtonWithIconNormal:(UIImage*)_iconNormal iconHighlighted:(UIImage*)_iconHighlighted size:(CGSize)_size;

//创建一张水平方向自适应大小的图片(midImg会被自动平铺)
+ (UIImage*) getHorizontalAutoWrapImage : (const float) width  leftImgName: (NSString*)_leftImgName midImgName: (NSString*)_midImgName  rightImgName: (NSString*)_rightImgName;

//创建自适应图片大小的imageview
+ (UIImageView*) getAutoWrapImageView : (UIImage*) _imgNormal  imgHigh : (UIImage*) _imgHigh;


//创建一个自定义大小行数的表格
+ (UIView*) getRectAutoWrapView : (UIColor*) bgcolor  bordercolor : (UIColor*)_bordercolor  borderwidth : (float)_borderwidth  cornerradius: (float)_cornerradius size: (CGSize)_size splitelinenum: (int)_num;



@end
