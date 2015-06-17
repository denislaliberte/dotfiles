
function t2u() {
    ctags --fields=+latinK -R
    tags2uml --infile tags --outfile MySourceCode.dot
    dot -Tpng -oMySourceCode.png MySourceCode.dot
    open MySourceCode.png
}
