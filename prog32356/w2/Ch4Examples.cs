using system;

namespace sheridan.prog32356.Ch4Examples 
{
	/*
	 * Fields are any variables associated with a class
	 */
	class Fields
	{
		//const variables cannot be instance members
		private const int _cnstVar = 0;

		//Fields that have a 'readonly' modifier can be assigned only
		// values from constructors.
		private static readonly int _rdonlyVar = 1;
	}

	/*
	 * A Properties are sets of functions that can be accessed from the
	 *	client in a similar way to public fields of the class.
	 */
	class Properties
	{//The idea of a property is that it is a method or a pair of methods
	 //	dressed to look like a field. 

		private int _prop; //_prop is referred to as the 'backing variable' to Prop
		public int Prop {  //This is the property for _prop
			//The get accessor takes no parameters and must return the same type
			//	as the declated property.
			get { return _prop;  }
			//The compiler assumes the set accessor takes a single parameter of the
			//	same type as the declared property and is referred to as 'value'.
			set { _prop = value; }
		}

		/*
		 * Expression-Bodied Property Accessors (C# 7 and higher)
		 *	Reduces the need to write curly brackets, and the return keyword is 
		 *	omitted.
		 */
		 private int _exprProp;
		 public int ExprProp {
		 	get => _exprProp;
		 	set => _exprProp = value;
		 }

		/*
		 * Expression-Bodied Property Accessors (C# 7 and higher)
		 *	Implement the backing member variable automatically.
		 *	With this method, you cannot access the field directly as you 
		 *	don't know the name the compiler generates.
		 */
	  public int AutoImpProp {get; set;}

	  //This style can be initialized in the following manner:
	  public int AutoImpProp_2 {get; set;} = 42; 

	  /*
	   * Property Access Modifiers
	   *  Property access modifiers can help control how and when a property
	   *	 can be set.
	   *  This can also be done using auto-implemented properties.
	   */
	  public int PrivateAccess {
	  	get => _privateAccess;
	  	private set => _privateAccess = value;
	  }

	  /*
	   * Read-Only Properties
		 *	It is possible to create a read-only property by simply omitting the
		 *	set accessor from the property definition.
	   */
	  public int OnlyRead {
	  	get => _onlyRead;
	  }

	  /*
	   * Expression-Bodied Properties
	   *	 Are propterties with the get accessor, but with the get keyword 
	   *	 omitted. The lambda operator can be used instead as follows
	   */
	  public int Sum => AutoImpProp + PrivateAccess;
	}

	class Immutable
	{
		public NoChange {
			get => _noChange;
		}
	}

	/*
	 * Anonymous Types 
	 *	Simply a nameless class that inherits from object. The definition of the
	 *	class is inferred from the initializer
	 */
	var anonymous = new 
	{
		Prop1 = 0,
		Prop2 = 0,
		Prop3 = 0
	}
}