//
//  SHCustomListPicker.h
//  Dimension
//
//  Created by Darshan R on 07/05/15.
//  Copyright (c) 2015 CereBrahm Innovations. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LIST_PICKER_WIDTH    500
#define LIST_PICKER_HEIGHT   216
#define LIST_PICKER_X        (SCREEN_WIDTH - LIST_PICKER_WIDTH) / 2
#define LIST_PICKER_Y        ((SCREEN_HEIGHT - LIST_PICKER_HEIGHT)/2)

@protocol SHCustomListPickerDelegate <NSObject>

@optional
-(void)didCancelButtonClicked;
-(void)didDoneButtonClicked:(NSString*)selectedItem;
-(void)didExtraButtonPressed;

@end

@interface SHCustomListPicker : UIView<UIPickerViewDataSource,UIPickerViewDelegate>{
    UIPickerView *pickerView;
    UIView *backgroundView;
    NSString *selectedItem;
    
    int secondIndex;
    int thirdIndex;
    int fourthIndex;
    BOOL hasExtraButton;
    NSString *extraButtonTitle;
}

@property (nonatomic) id<SHCustomListPickerDelegate> delegate;
@property (nonatomic) NSArray *pickerList;
@property (nonatomic) NSString *title;
@property (nonatomic) BOOL isIndexed;
@property (nonatomic) BOOL isSearchable; //not used for now

-(void)showPicker:(UIView*)mainView;
-(void) hasExtraButtonWithTitle:(NSString*)title;

+(instancetype)getListPickerFor:(NSArray*)pickerList;
-(void)setupPicker;

@end
