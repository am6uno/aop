
public aspect TraceAspectMiller {
	pointcut classToTrace(): within(*App);
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	before(): methodToTrace() {
		String info = "[BGN] " + thisJoinPointStaticPart.getSignature() + ", " +
				thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println(info);
	}
	
	after(): methodToTrace() {
		String info = "[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName();
		System.out.println(info);
	}
}
