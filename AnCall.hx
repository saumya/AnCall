package;

#if (android && openfl)

import lime.system.JNI;

class AnCall {
	
	public static function callNum(numString:String):Void{
		ancall_call_num_jni(numString);
	}
	
	//private static var ancall_sample_method_jni = JNI.createStaticMethod ("org.haxe.extension.AnCall", "sampleMethod", "(I)I");
	private static var ancall_call_num_jni = JNI.createStaticMethod ("org.haxe.extension.AnCall", "callPhoneNum", "(Ljava/lang/String;)V");
	
}
#end