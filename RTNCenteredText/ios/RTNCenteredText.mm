#import "RTNCenteredText.h"

#import <react/renderer/components/RTNCenteredTextSpecs/ComponentDescriptors.h>
#import <react/renderer/components/RTNCenteredTextSpecs/EventEmitters.h>
#import <react/renderer/components/RTNCenteredTextSpecs/Props.h>
#import <react/renderer/components/RTNCenteredTextSpecs/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface RTNCenteredText () <RCTRTNCenteredTextViewProtocol>
@end

@implementation RTNCenteredText {
  UIView *_view;
  UILabel *_label;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<RTNCenteredTextComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    //static const auto defaultProps = std::make_shared<const RTNCenteredTextProps>();
    //_props = defaultProps;

    _view = [[UIView alloc] init];
    _view.backgroundColor = [UIColor lightGrayColor];

    _label = [[UILabel alloc] init];
    _label.textColor = [UIColor blackColor];
    _label.text = @"Initial value";
    [_view addSubview:_label];

    _label.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
      [_label.leadingAnchor constraintEqualToAnchor:_view.leadingAnchor],
      [_label.topAnchor constraintEqualToAnchor:_view.topAnchor],
      [_label.trailingAnchor constraintEqualToAnchor:_view.trailingAnchor],
      [_label.bottomAnchor constraintEqualToAnchor:_view.bottomAnchor],
    ]];

    _label.textAlignment = NSTextAlignmentCenter;

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<RTNCenteredTextProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<RTNCenteredTextProps const>(props);

  if (!_props.get() || oldViewProps.hasBlueText != newViewProps.hasBlueText) {
    _label.textColor = newViewProps.hasBlueText ? [UIColor blueColor] : [UIColor blackColor];
  }

  if (!_props.get() || oldViewProps.hasRedBackground != newViewProps.hasRedBackground) {
    _view.backgroundColor = newViewProps.hasRedBackground ? [UIColor redColor] : [UIColor lightGrayColor];
  }

  if (!_props.get() || ((oldViewProps.text != newViewProps.text) && !newViewProps.text.empty())) {
    _label.text = [NSString stringWithCString: newViewProps.text.c_str() encoding:NSUTF8StringEncoding];
  }

  [super updateProps:props oldProps:oldProps];
}

@end

Class<RCTComponentViewProtocol> RTNCenteredTextCls(void)
{
  return RTNCenteredText.class;
}
