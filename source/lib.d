import std.conv;
import std.string;
import std.stdio;
import core.memory;
import core.runtime;

// Interface

template Callback(Args...) 
{
	extern(C) alias Callback = void function(immutable(char)*, Args...); 
}

extern(C) alias StringCallback = void function(immutable(char)*, immutable(char)*);

extern (C) 
{
	void init()
	{
		rt_init();
	}

	void shutdown()
	{
		rt_term();
	}

	int ping() 
	{
		//writeln("ping");
		return 555;
	}

	void sayHello(immutable(char)* name, StringCallback cb)
	{
		try
		{
			throw new Exception("Boo");
//			string toName = name.fromStringz;
//			auto result = ("Hello, " ~ toName).toStringz;
//			cb(null, result);
		}
		catch(Exception e)
		{
			cb(e.msg.toStringz, null);
		}
	}
}