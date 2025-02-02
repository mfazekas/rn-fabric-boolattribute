import type { ViewProps } from "ViewPropTypes";
import type { HostComponent } from "react-native";
import codegenNativeComponent from "react-native/Libraries/Utilities/codegenNativeComponent";

export interface NativeProps extends ViewProps {
  hasBlueText: boolean;
  hasRedBackground: boolean;
  text: string;
}

export default codegenNativeComponent<NativeProps>(
  "RTNCenteredText"
) as HostComponent<NativeProps>;