package br.com.mithril.javalog;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import alice.tuprolog.InvalidTheoryException;
import alice.tuprolog.MalformedGoalException;
import alice.tuprolog.Prolog;
import alice.tuprolog.SolveInfo;
import alice.tuprolog.Theory;

public class App {
	public static void main(String[] args)
			throws MalformedGoalException, InvalidTheoryException, FileNotFoundException, IOException {
		
		
		Prolog engine = new Prolog();
		engine.addTheory(new Theory(new FileInputStream("prolog/database.pl")));
		//SolveInfo info = engine.solve("ex(a,A), ex(b,B), mm(A,B,C), simplist(C, D).");
		//System.out.println(info.toString());
		
		SolveInfo info = engine.solve("removeLast([a,b,d,e],U).");
		System.out.println(info.toString());
	}
}
