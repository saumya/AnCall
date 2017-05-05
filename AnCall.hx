package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end


class AnCall {
	
	
	public static function sampleMethod (inputValue:Int):Int {
		
		#if (android && openfl)
		
		var resultJNI = ancall_sample_method_jni(inputValue);
		var resultNative = ancall_sample_method(inputValue);
		
		if (resultJNI != resultNative) {
			
			throw "Fuzzy math!";
			
		}
		
		return resultNative;
		
		#else
		
		return ancall_sample_method(inputValue);
		
		#end
		
	}
	
	
	private static var ancall_sample_method = Lib.load ("ancall", "ancall_sample_method", 1);
	
	#if (android && openfl)
	private static var ancall_sample_method_jni = JNI.createStaticMethod ("org.haxe.extension.AnCall", "sampleMethod", "(I)I");
	#end
	
	
}