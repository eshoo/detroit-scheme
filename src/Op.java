// Copyright (c) 2009, Raymond R. Medeiros. All rights reserved.


package detroit;

import java.util.*;

public final class Op
{
	public int type;
	public int p1, p2;
	public Vector libSlots;
	public Procedure proc;
	public Object literal;

	public Op(int type, int p1, int p2, Vector libSlots, Procedure proc, Object literal)
	{
		this.type = type;
		this.p1 = p1;
		this.p2 = p2;
		this.libSlots = libSlots;
		this.proc = proc;
		this.literal = literal;
	}
}
