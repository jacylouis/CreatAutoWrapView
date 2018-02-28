//
//  Utils.m
//  BanTang
//
//  Created by EricYang on 2017/6/27.
//  Copyright © 2017年 yanyanhuyu. All rights reserved.
//

#import "Utils.h"

@implementation Utils

#pragma mark 功能函数
+ (BOOL) isEmpty : (NSString*) str
{
    if (str == nil || str.length == 0)
    {
        return  YES;
    }
    else
    {
        return NO;
    }
}

+ (UILabel*) getAutoWrapLabel : (UIFont*) font  text : (NSString*) _text
{
    return [self getAutoWrapLabel:font text:_text size:CGSizeMake(kScreenWidth, kScreenHeight)];
}

+ (UILabel*) getAutoWrapLabel : (UIFont*) font  text : (NSString*) _text  width : (float) _width
{
    if (font == nil)
    {
        font = [UIFont systemFontOfSize:10];
    }
    
    CGSize lblNumSize = CGSizeZero;
    UILabel* lbl = [[UILabel alloc] init];
    //计算文字占宽
    lblNumSize = [[Utils isEmpty:_text] ? @"国" : _text sizeWithFont:font forWidth:_width lineBreakMode:NSLineBreakByTruncatingTail];  //// 省略尾部,...代替
    lbl.frame = CGRectMake(0, 0, lblNumSize.width, lblNumSize.height);
    lbl.font = font;
    lbl.text = _text;
    lbl.backgroundColor = [UIColor clearColor];
    
    return  lbl;
}

+ (UILabel*) getAutoWrapLabel : (UIFont*) font text : (NSString*) _text  size: (CGSize) _size
{
    if (font == nil)
    {
        font = [UIFont systemFontOfSize:10];
    }
    
    CGSize lblNumSize = CGSizeZero;
    UILabel* lbl = [[UILabel alloc] init];
    //计算文字占宽
    lblNumSize = [[Utils isEmpty:_text] ? @"国" : _text sizeWithFont:font constrainedToSize:CGSizeMake(_size.width, _size.height) lineBreakMode:NSLineBreakByTruncatingTail];  //// 省略尾部,...代替
    lbl.numberOfLines = 0;
    lbl.frame = CGRectMake(0, 0, lblNumSize.width, lblNumSize.height);
    lbl.font = font;
    lbl.text = _text;
    lbl.backgroundColor = [UIColor clearColor];
    
    return  lbl;
}


+ (UILabel*)getAutoWrapLabel:(UIFont*)font text:(NSString*)_text origin:(CGPoint)_point
{
    return [self getAutoWrapLabel:font text:_text origin:_point maxSize:CGSizeMake(kScreenWidth, kScreenHeight)];
}

+ (UILabel*)getAutoWrapLabel:(UIFont*)font text:(NSString*)_text origin:(CGPoint)_point maxSize:(CGSize) _size
{
    if (font == nil)
    {
        font = [UIFont systemFontOfSize:10];
    }
    
    CGSize lblNumSize = CGSizeZero;
    UILabel* lbl = [[UILabel alloc] init];
    //计算文字占宽
    lblNumSize = [[Utils isEmpty:_text] ? @"国" : _text sizeWithFont:font constrainedToSize:CGSizeMake(_size.width, _size.height) lineBreakMode:NSLineBreakByTruncatingTail];  //// 省略尾部,...代替
    lbl.numberOfLines = 0;
    lbl.frame = CGRectMake(_point.x, _point.y, lblNumSize.width, lblNumSize.height);
    lbl.font = font;
    lbl.text = _text;
    lbl.backgroundColor = [UIColor clearColor];
    
    return  lbl;
}

//根据一个unix时间戳转换为时间格式
+ (NSString*) getFormatTime : (NSInteger) unixTimeStamp
{
    if (unixTimeStamp <= 0)
    {
        return @"";
    }
    NSString *time = [YYHHelper dynamicDateFormatStringWithTimeInterval:unixTimeStamp];
    return time;
}

+ (UIImageView*) getAutoWrapImageView : (NSString*) imgNameNormal  imgNameHigh : (NSString*) _imgNameHigh
{
    if (imgNameNormal == nil)
    {
        return  nil;
    }
    
    UIImage* imgNormal = [UIImage imageNamed:imgNameNormal];
    UIImage* imgHigh = nil;
    if(_imgNameHigh != nil)
    {
        imgHigh = [UIImage imageNamed:_imgNameHigh];
    }
    
    return [self getAutoWrapImageView:imgNormal imgHigh:imgHigh];
}

+ (UIImageView*) getAutoWrapImageView : (UIImage*) _imgNormal  imgHigh : (UIImage*) _imgHigh
{
    if (!_imgNormal)
    {
        return nil;
    }
    
    UIImageView* iv = [[UIImageView alloc] initWithImage:_imgNormal];
    
    if(_imgHigh)
    {
        [iv setHighlightedImage:_imgHigh];
    }
    CGRect frame = iv.frame;
    frame.size.width = _imgNormal.size.width/2;
    frame.size.height = _imgNormal.size.height/2;
    iv.frame = frame;
    iv.backgroundColor = [UIColor clearColor];
    
    return  iv;
}

+ (UIImageView*)getAutoWrapImageWithName:(NSString*)_imgName origin:(CGPoint)_point
{
    UIImage* image = [UIImage imageNamed:_imgName];
    if (image)
    {
        UIImageView* iv = [[UIImageView alloc] initWithImage:image];
        
        CGRect frame = iv.frame;
        frame.origin = _point;
        frame.size.width = image.size.width/2;
        frame.size.height = image.size.height/2;
        iv.frame = frame;
        iv.backgroundColor = [UIColor clearColor];
        
        return iv;
    }
    return  nil;
}

+ (UIButton*) getAutoWrapButton : (NSString*) imgNameNormal  imgNameHigh: (NSString*) _imgNameHigh
{
    return [self getAutoWrapButton:imgNameNormal imgNameHigh: _imgNameHigh  text: nil  font: nil  color: nil];
}

+ (UIButton*) getAutoWrapButton : (UIImage*) imgNormal imgHigh: (UIImage*) _imgHigh
{
    return [self getAutoWrapButton: imgNormal  imgHigh: _imgHigh  text: nil  font: nil  color: nil];
}


+ (UIButton*) getAutoWrapButton : (NSString*) imgNameNormal imgNameHigh: (NSString*) _imgNameHigh text: (NSString*) _text font: (UIFont*) _font color: (UIColor*) _color
{
    UIImage* imgNormal = [UIImage imageNamed:imgNameNormal];
    UIImage* _imgHigh = [UIImage imageNamed:_imgNameHigh];
    
    return [self getAutoWrapButton: imgNormal imgHigh: _imgHigh text: _text font: _font color: _color];
    
}

+ (UIButton*) getAutoWrapButton: (UIImage*) imgNormal  imgHigh: (UIImage*) _imgHigh text: (NSString*) _text  font: (UIFont*) _font  color: (UIColor*) _color
{
    if (!imgNormal && !_imgHigh)
    {
        return nil;
    }
    
    UIButton* btn = [[UIButton alloc] init];
    [btn setBackgroundImage:imgNormal forState:UIControlStateNormal];
    [btn setBackgroundImage:_imgHigh forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, imgNormal != nil ? imgNormal.size.width : _imgHigh.size.width, imgNormal != nil ? imgNormal.size.height : _imgHigh.size.height);
    
    [btn setTitle:_text forState:UIControlStateNormal];
    [btn setTitleColor:_color forState:UIControlStateNormal];
    [btn.titleLabel setFont:(_font == nil ? [UIFont systemFontOfSize:17] : _font)];
    
    return btn;
}

+ (UIButton*)getAutoWrapButton:(NSString*)_imgNameNormal imgNameHigh:(NSString*)_imgNameHigh title:(NSString*)_title font:(UIFont*)_font titleColor:(UIColor*)_titleColor size:(CGSize)_size
{
    if ([Utils isEmpty:_imgNameNormal] && [Utils isEmpty:_imgNameHigh])
    {
        return nil;
    }
    
    UIImage* imgNormal = [UIImage imageNamed:_imgNameNormal];
    UIImage* imgHigh = [UIImage imageNamed:_imgNameHigh];
    
    return [self getAutoWrapButton:imgNormal imgHigh:imgHigh title:_title font:_font titleColor:_titleColor size:_size];
}

+ (UIButton*)getAutoWrapButton:(NSString*)_imgNameNormal imgNameHigh:(NSString*)_imgNameHigh imgDisabled:(NSString*)_imgDisabled title:(NSString*)_title font:(UIFont*)_font titleColor:(UIColor*)_titleColor size:(CGSize)_size
{
    if ([Utils isEmpty:_imgNameNormal] && [Utils isEmpty:_imgNameHigh])
    {
        return nil;
    }
    
    UIImage* imgNormal = [UIImage imageNamed:_imgNameNormal];
    UIImage* imgHigh = [UIImage imageNamed:_imgNameHigh];
    UIImage* imgDisabled = [UIImage imageNamed:_imgDisabled];
    
    return [self getAutoWrapButton:imgNormal imgHigh:imgHigh imgDisabled:imgDisabled title:_title font:_font titleColor:_titleColor size:_size];
}

+ (UIButton*)getAutoWrapButton:(UIImage*)_imgNormal imgHigh:(UIImage*)_imgHigh title:(NSString*)_title font:(UIFont*)_font titleColor:(UIColor*)_titleColor size:(CGSize)_size
{
    if (!_imgNormal && !_imgHigh)
    {
        return nil;
    }
    
    return [self getAutoWrapButton:_imgNormal imgHigh:_imgHigh imgDisabled:nil title:_title font:_font titleColor:_titleColor size:_size];
}

+ (UIButton*)getAutoWrapButton:(UIImage*)_imgNormal imgHigh:(UIImage*)_imgHigh imgDisabled:(UIImage*)_imgDisabled title:(NSString*)_title font:(UIFont*)_font titleColor:(UIColor*)_titleColor size:(CGSize)_size
{
    if (!_imgNormal && !_imgHigh)
    {
        return nil;
    }
    
    if (_imgNormal)
    {
        UIGraphicsBeginImageContext(CGSizeMake(_size.width*2, _size.height*2));
        [[_imgNormal stretchableImageWithLeftCapWidth:_imgNormal.size.width/2 topCapHeight:_imgNormal.size.height/2] drawInRect:CGRectMake(0, 0, _size.width*2, _size.height*2)];
        _imgNormal = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    if (_imgHigh)
    {
        UIGraphicsBeginImageContext(CGSizeMake(_size.width*2, _size.height*2));
        [[_imgHigh stretchableImageWithLeftCapWidth:_imgHigh.size.width/2 topCapHeight:_imgHigh.size.height/2] drawInRect:CGRectMake(0, 0, _size.width*2, _size.height*2)];
        _imgHigh = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    if (_imgDisabled)
    {
        UIGraphicsBeginImageContext(CGSizeMake(_size.width*2, _size.height*2));
        [[_imgDisabled stretchableImageWithLeftCapWidth:_imgDisabled.size.width/2 topCapHeight:_imgDisabled.size.height/2] drawInRect:CGRectMake(0, 0, _size.width*2, _size.height*2)];
        _imgDisabled = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
    [btn setBackgroundImage:_imgNormal forState:UIControlStateNormal];
    [btn setBackgroundImage:_imgHigh forState:UIControlStateHighlighted];
    if (_imgDisabled)
    {
        [btn setBackgroundImage:_imgDisabled forState:UIControlStateDisabled];
    }
    
    [btn setTitle:_title forState:UIControlStateNormal];
    [btn setTitleColor:_titleColor forState:UIControlStateNormal];
    [btn.titleLabel setFont:(_font == nil ? [UIFont systemFontOfSize:17] : _font)];
    
    return btn;
}

+ (UIButton*)getAutoWrapButtonWithTitle:(NSString*)_title font:(UIFont*)_font titleColor:(UIColor*)_titleColor height:(float)_height
{
    //自适应文字长度, 左右留固定间距
    CGSize lblNumSize = [_title sizeWithFont:_font constrainedToSize:CGSizeMake(kScreenWidth, kScreenHeight) lineBreakMode:NSLineBreakByWordWrapping];
    
    CGSize finalSize = CGSizeMake(lblNumSize.width+20, _height);
    
    return [self getAutoWrapButtonWithTitle:_title font:_font titleColor:_titleColor size:finalSize];
}

+ (UIButton*)getAutoWrapButtonWithTitle:(NSString*)_title font:(UIFont*)_font titleColor:(UIColor*)_titleColor size:(CGSize)_size
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
    [btn setTitle:_title forState:UIControlStateNormal];
    [btn setTitleColor:_titleColor forState:UIControlStateNormal];
    [btn.titleLabel setFont:(_font == nil ? [UIFont systemFontOfSize:17] : _font)];
    
    return btn;
}

+ (UIButton*)getAutoWrapButtonWithIconNormalName:(NSString*)_iconNormalName iconHighlighted:(NSString*)_iconHighlightedName size:(CGSize)_size
{
    UIImage* imgIconNormal = [UIImage imageNamed:_iconNormalName];
    UIImage* imgIconHighlighted = [UIImage imageNamed:_iconHighlightedName];
    
    return [self getAutoWrapButtonWithIconNormal:imgIconNormal iconHighlighted:imgIconHighlighted size:_size];
}

+ (UIButton*)getAutoWrapButtonWithIconNormal:(UIImage*)_iconNormal iconHighlighted:(UIImage*)_iconHighlighted size:(CGSize)_size
{
    if ((_iconNormal == nil && _iconHighlighted == nil) || (_size.width <= 0 && _size.height <= 0))
    {
        return nil;
    }
    
    UIImage* tempImage = _iconNormal == nil ? _iconHighlighted : _iconNormal;
    
    UIButton* tempBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
    [tempBtn setImage:_iconNormal forState:UIControlStateNormal];
    [tempBtn setImage:_iconHighlighted forState:UIControlStateHighlighted];
    [tempBtn setImageEdgeInsets:UIEdgeInsetsMake((tempBtn.frame.size.height - tempImage.size.height/2)/2, (tempBtn.frame.size.width - tempImage.size.width/2)/2, (tempBtn.frame.size.height - tempImage.size.height/2)/2, (tempBtn.frame.size.width - tempImage.size.width/2)/2)];
    
    return tempBtn;
}

+ (UIButton*)get3xAutoWrapButtonWithIconNormalName:(NSString*)_iconNormalName iconHighlighted:(NSString*)_iconHighlightedName size:(CGSize)_size
{
    UIImage* imgIconNormal = [UIImage imageNamed:_iconNormalName];
    UIImage* imgIconHighlighted = [UIImage imageNamed:_iconHighlightedName];
    
    return [self get3xAutoWrapButtonWithIconNormal:imgIconNormal iconHighlighted:imgIconHighlighted size:_size];
}

+ (UIButton*)get3xAutoWrapButtonWithIconNormal:(UIImage*)_iconNormal iconHighlighted:(UIImage*)_iconHighlighted size:(CGSize)_size
{
    if ((_iconNormal == nil && _iconHighlighted == nil) || (_size.width <= 0 && _size.height <= 0))
    {
        return nil;
    }
    
    UIImage* tempImage = _iconNormal == nil ? _iconHighlighted : _iconNormal;
    
    UIButton* tempBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
    [tempBtn setImage:_iconNormal forState:UIControlStateNormal];
    [tempBtn setImage:_iconHighlighted forState:UIControlStateHighlighted];
    [tempBtn setImageEdgeInsets:UIEdgeInsetsMake((tempBtn.frame.size.height - tempImage.size.height/3)/2, (tempBtn.frame.size.width - tempImage.size.width/3)/2, (tempBtn.frame.size.height - tempImage.size.height/3)/2, (tempBtn.frame.size.width - tempImage.size.width/3)/2)];
    
    return tempBtn;
}

+ (UIImage*) getHorizontalAutoWrapImage : (const float) width leftImgName: (NSString*)_leftImgName midImgName: (NSString*)_midImgName rightImgName: (NSString*)_rightImgName
{
    if (width <= 0)
    {
        return  nil;
    }
    
    //左边图片一定不能为空
    if ([self isEmpty:_leftImgName])
    {
        return  nil;
    }
    
    UIImage* img;
    UIImage* imgLeft = [UIImage imageNamed:_leftImgName];
    UIImage* imgMid = [self isEmpty:_midImgName] ? nil : [UIImage imageNamed:_midImgName];
    UIImage* imgRight = [self isEmpty:_rightImgName] ? nil : [UIImage imageNamed:_rightImgName];
    
    const int HEIGHT = imgLeft.size.height;
    int leftWidth = imgLeft.size.width;
    UIGraphicsBeginImageContext(CGSizeMake(width , HEIGHT));
    [imgLeft drawInRect:CGRectMake(0, 0, imgLeft.size.width, HEIGHT)];
    
    //right
    int rightWidth = 0;   //右边的宽度
    if (imgRight)
    {
        rightWidth = imgRight.size.width;
        [imgRight drawInRect:CGRectMake(width - rightWidth, 0, rightWidth, HEIGHT)];
    }
    
    int midWidth = 0;
    if (imgMid)
    {
        midWidth = width - leftWidth - rightWidth;
        [imgMid drawAsPatternInRect:CGRectMake(leftWidth, 0, midWidth, HEIGHT)];
    }
    
    if (midWidth == 0)   //没有中间图片就用左边的替代
    {
        [imgLeft drawAsPatternInRect:CGRectMake(leftWidth, 0, width - leftWidth - rightWidth, HEIGHT)];
    }
    
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

+ (UIView*) getRectAutoWrapView : (UIColor*) bgcolor  bordercolor : (UIColor*)_bordercolor  borderwidth : (float)_borderwidth  cornerradius: (float)_cornerradius size: (CGSize)_size splitelinenum: (int)_num
{
    UIView* vBoardAuto = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
    vBoardAuto.backgroundColor = bgcolor;
    vBoardAuto.layer.borderColor = [_bordercolor CGColor];
    vBoardAuto.layer.borderWidth = _borderwidth;
    vBoardAuto.layer.cornerRadius = _cornerradius;
    //    vBoardAuto.layer.masksToBounds = YES;
    float itemheight = (_size.height - (_num+2)*_borderwidth)/ (_num + 1);
    UIView* line;
    if (_num != 0)
    {
        float dy = itemheight + _borderwidth;
        for (int i = 0; i < _num; i++)
        {
            line = [[UIView alloc]initWithFrame:CGRectMake(_borderwidth, dy, (_size.width - _borderwidth*2), _borderwidth)];
            line.backgroundColor = _bordercolor;
            [vBoardAuto addSubview:line];
            dy += itemheight + _borderwidth;
        }
    }
    
    return vBoardAuto;
}


@end
