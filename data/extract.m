(* ::Package:: *)

SetDirectory@NotebookDirectory[];
split[g_] := Block[
	{s = StringSplit[g, "\n"], base, digit},
	{base, digit} = ToExpression /@ StringSplit[First@s, "/"];
	ToString@base -> StringTrim /@ Rest@s
];
table[a_String -> b_List] := Block[
	{ns = TemplateApply["|`1`|`2`|", {#, StringLength@#}] & /@ b},
	TemplateApply["## Base: `1` (`2`)
|Number|Digit|
|-:|-:|
`3`",
		{a, Length@b, StringRiffle[ns, "\n"]}
	]
];


groups = Rest@StringSplit[Import["narcissistic.txt"], "b/n ="];
byBase = #[[1, 1]] -> Flatten@#[[All, -1]]& /@ GatherBy[split /@ groups, First];
Export["narcissistic.json", byBase, "JSON"]
byTable = "# Narcissistic Numbers\n" <> StringRiffle[table /@ byBase, "\n\n"];
Export["readme.md", byTable, "Text"]



