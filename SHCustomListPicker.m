//
//  SHCustomListPicker.m
//  Dimension
//
//  Created by Darshan R on 07/05/15.
//  Copyright (c) 2015 CereBrahm Innovations. All rights reserved.
//

#import "SHCustomListPicker.h"

@implementation SHCustomListPicker

-(id)init {
    self = [super init];
    if (self) {
        backgroundView = [[UIView alloc] init];
        [self addSubview:backgroundView];
        backgroundView.layer.cornerRadius = 5;
        backgroundView.layer.masksToBounds = YES;
    }
    return self;
}

+(instancetype)getListPickerFor:(NSArray*)pickerList{
    SHCustomListPicker *picker = [[SHCustomListPicker alloc] init];
    [picker setPickerList:pickerList];
    return picker;
}

-(void)setPickerList:(NSArray *)pickerList{
    _pickerList = [pickerList sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    // traversing the array in the reverse to get the index of the smallest letter matching the string in the list.
    for (int i = (int)[_pickerList count] - 1; i > 0; i--) {
        if ([_pickerList[i] hasPrefix:@"G"] || [_pickerList[i] hasPrefix:@"H"] || [_pickerList[i] hasPrefix:@"I"] || [_pickerList[i] hasPrefix:@"J"] || [_pickerList[i] hasPrefix:@"K"] || [_pickerList[i] hasPrefix:@"L"]) {
            secondIndex = i;
        } else if([_pickerList[i] hasPrefix:@"M"] || [_pickerList[i] hasPrefix:@"N"] || [_pickerList[i] hasPrefix:@"O"] || [_pickerList[i] hasPrefix:@"P"] || [_pickerList[i] hasPrefix:@"Q"] || [_pickerList[i] hasPrefix:@"R"]) {
            thirdIndex = i;
        } else if([_pickerList[i] hasPrefix:@"S"] || [_pickerList[i] hasPrefix:@"T"] || [_pickerList[i] hasPrefix:@"U"] || [_pickerList[i] hasPrefix:@"V"] || [_pickerList[i] hasPrefix:@"W"] || [_pickerList[i] hasPrefix:@"X"] ||[_pickerList[i] hasPrefix:@"Y"] || [_pickerList[i] hasPrefix:@"Z"]) {
            fourthIndex = i;
        }
    }
}

-(void) hasExtraButtonWithTitle:(NSString*)title{
    hasExtraButton = YES;
    extraButtonTitle = title;
}

-(void)setupPicker {
    
    int titleHeight = 50;
    int viewY = 0;
    int viewX = 0;
    UILabel *pickerTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, viewY, LIST_PICKER_WIDTH, titleHeight)];
    if (self.title) {
        [pickerTitle setText:self.title];
    } else {
        [pickerTitle setText:@"Choose"];
    }
    [pickerTitle setBackgroundColor:CLEAR_COLOR];
    [pickerTitle setTextAlignment:NSTextAlignmentCenter];
    [backgroundView addSubview:pickerTitle];
    
    viewY += titleHeight;
    
    UILabel *titleSeperator = [[UILabel alloc] initWithFrame:CGRectMake(0, viewY, LIST_PICKER_WIDTH, 1)];
    [titleSeperator setBackgroundColor:LIT_GRAY_COLOR];
    [backgroundView addSubview:titleSeperator];
    
    viewY += 1;

    if (self.isIndexed) {
        int indexViewWidth = LIST_PICKER_WIDTH / 10;
        UIView *indexView = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, indexViewWidth, LIST_PICKER_HEIGHT)];
        int btnWidth = indexViewWidth;
        int btnHeight = (LIST_PICKER_HEIGHT / 4); // Equally dividing the picker height between the buttons.
        int btnY = 0;
        
        UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(viewX, btnY, btnWidth, btnHeight)];
        [btn1 setTitle:@"A-F" forState:UIControlStateNormal];
        [btn1.titleLabel setLineBreakMode:NSLineBreakByCharWrapping];
        [btn1 setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
        [btn1 setTag:1];
        [btn1 addTarget:self action:@selector(indexBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [indexView addSubview:btn1];
        
        btnY = btnY + CGRectGetHeight(btn1.frame);
        
        UILabel *indexMiddleSeparator = [[UILabel alloc] initWithFrame:CGRectMake(viewX, btnY, btnWidth, 1)];
        [indexMiddleSeparator setBackgroundColor:LIT_GRAY_COLOR];
        [indexView addSubview:indexMiddleSeparator];
        
        UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(viewX, btnY, btnWidth, btnHeight)];
        [btn2 setTitle:@"G-L" forState:UIControlStateNormal];
        [btn2.titleLabel setLineBreakMode:NSLineBreakByCharWrapping];
        [btn2 setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
        [btn2 setTag:2];
        [btn2 addTarget:self action:@selector(indexBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [indexView addSubview:btn2];
        
        btnY = btnY + CGRectGetHeight(btn2.frame);
        indexMiddleSeparator = [[UILabel alloc] initWithFrame:CGRectMake(viewX, btnY, btnWidth, 1)];
        [indexMiddleSeparator setBackgroundColor:LIT_GRAY_COLOR];
        [indexView addSubview:indexMiddleSeparator];
        
        UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(viewX, btnY, btnWidth, btnHeight)];
        [btn3 setTitle:@"M-R" forState:UIControlStateNormal];
        [btn3.titleLabel setLineBreakMode:NSLineBreakByCharWrapping];
        [btn3 setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
        [btn3 setTag:3];
        [btn3 addTarget:self action:@selector(indexBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [indexView addSubview:btn3];
        
        btnY = btnY + CGRectGetHeight(btn3.frame);
        indexMiddleSeparator = [[UILabel alloc] initWithFrame:CGRectMake(viewX, btnY, btnWidth, 1)];
        [indexMiddleSeparator setBackgroundColor:LIT_GRAY_COLOR];
        [indexView addSubview:indexMiddleSeparator];
        
        UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(viewX, btnY, btnWidth, btnHeight)];
        [btn4 setTitle:@"S-Z" forState:UIControlStateNormal];
        [btn4.titleLabel setLineBreakMode:NSLineBreakByCharWrapping];
        [btn4 setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
        [btn4 setTag:4];
        [btn4 addTarget:self action:@selector(indexBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [indexView addSubview:btn4];

        [backgroundView addSubview:indexView];
        viewX = viewX + CGRectGetWidth(indexView.frame);
        
        UILabel *indexSeparator = [[UILabel alloc] initWithFrame:CGRectMake(viewX, viewY, 1, LIST_PICKER_HEIGHT)];
        [indexSeparator setBackgroundColor:LIT_GRAY_COLOR];
        [backgroundView addSubview:indexSeparator];
        viewX = viewX + CGRectGetWidth(indexSeparator.frame);
    }
    
    if (viewY == 0) {
        viewY = LIST_PICKER_Y;
    }
    pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(viewX, viewY, LIST_PICKER_WIDTH - viewX, LIST_PICKER_HEIGHT)];
    [pickerView setDelegate:self];
    [pickerView setDataSource:self];
    [backgroundView addSubview:pickerView];
    
    viewY += LIST_PICKER_HEIGHT;
    
    UIView *datePickerSeparator = [[UIView alloc] initWithFrame:CGRectMake(0, viewY, LIST_PICKER_WIDTH, 1)];
    [datePickerSeparator setBackgroundColor:LIT_GRAY_COLOR];
    [backgroundView addSubview:datePickerSeparator];
    
    viewY += 1;
    
    int widthOfButton = 0;
    int heightOfButton = 50;
    if (hasExtraButton) {
        widthOfButton = LIST_PICKER_WIDTH / 3;
    } else {
        widthOfButton = LIST_PICKER_WIDTH / 2;
    }

    int x = 0;
    
    if (hasExtraButton) {
        UIButton *btnDetail = [[UIButton alloc] initWithFrame:CGRectMake(x, viewY, widthOfButton, heightOfButton)];
        [btnDetail setTitle:extraButtonTitle forState:UIControlStateNormal];
        [btnDetail setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
        [btnDetail addTarget:self action:@selector(extraButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [backgroundView addSubview:btnDetail];
        [btnDetail setBackgroundColor:CLEAR_COLOR];
        
        x += widthOfButton;
        UIView *seperator1 = [[UIView alloc] initWithFrame:CGRectMake(x, viewY, 1, heightOfButton)];
        [seperator1 setBackgroundColor:LIT_GRAY_COLOR];
        [backgroundView addSubview:seperator1];
    }
    
    UIButton *btnCancel = [[UIButton alloc] initWithFrame:CGRectMake(x, viewY, widthOfButton-1, heightOfButton)];
    [btnCancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
    [btnCancel setBackgroundColor:CLEAR_COLOR];
    [btnCancel addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:btnCancel];
    
    x += widthOfButton;
    UIView *cancelButtonSeparator = [[UIView alloc] initWithFrame:CGRectMake(x, viewY, 1, heightOfButton)];
    [cancelButtonSeparator setBackgroundColor:LIT_GRAY_COLOR];
    [backgroundView addSubview:cancelButtonSeparator];
    
    UIButton *btnDone = [[UIButton alloc] initWithFrame:CGRectMake(x, viewY, widthOfButton-1, heightOfButton)];
    [btnDone setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
    [btnDone addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:btnDone];
    [btnDone setBackgroundColor:CLEAR_COLOR];

    int viewHeight = titleHeight + LIST_PICKER_HEIGHT + heightOfButton;
    backgroundView.frame = CGRectMake(LIST_PICKER_X, (LIST_PICKER_Y - titleHeight), LIST_PICKER_WIDTH, viewHeight);
    
    [backgroundView setBackgroundColor:WHITE_COLOR];
}

-(void)showPicker:(UIView*)mainView {
    
    selectedItem = [_pickerList firstObject];
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT + 20);
    [mainView addSubview:self];
}

#pragma mark - Index Button action

-(void)indexBtnPressed:(id)sender{
    
    UIButton *btnPressed = (UIButton*)sender;
    if (btnPressed.tag == 1) {
        [pickerView selectRow:0 inComponent:0 animated:YES];
        selectedItem = _pickerList[0];
    } else if (btnPressed.tag == 2){
        if (secondIndex) {
            [pickerView selectRow:secondIndex inComponent:0 animated:YES];
            selectedItem = _pickerList[secondIndex];
        }
    } else if (btnPressed.tag == 3){
        if (thirdIndex) {
            [pickerView selectRow:thirdIndex inComponent:0 animated:YES];
            selectedItem = _pickerList[thirdIndex];
        }
    } else if (btnPressed.tag == 4){
        if (fourthIndex) {
            [pickerView selectRow:fourthIndex inComponent:0 animated:YES];
            selectedItem = _pickerList[fourthIndex];
        }
    }
    
}

#pragma mark - Date Picker

-(IBAction)cancel:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didCancelButtonClicked)]) {
        [self.delegate didCancelButtonClicked];
    }
    [self removeFromSuperview];
}

-(IBAction)done:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didDoneButtonClicked:)]) {
        [self.delegate didDoneButtonClicked:selectedItem];
    }
    [self removeFromSuperview];
}

-(IBAction)extraButtonPressed:(id)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didExtraButtonPressed)]) {
        [self.delegate didExtraButtonPressed];
    }
    [self removeFromSuperview];
}

#pragma mark - UIPickerView methods

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerList.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_pickerList objectAtIndex:row];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40.0;
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    selectedItem = _pickerList[row];
}
@end
