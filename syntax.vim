" To find the colour of something, use 'hi Special'.

" List all the things
"%!sed -n 's/.*syntax match \([a-z]\+\).*/\1/p'|uniqnosort.sh

"[!+-=] " INCORRECT!! This creates number ranges
"[!+=-] " CORRECT!

" starting
" \(\(^\|│\)\s*\)\@<=
" finishing
" \(  \|$\|│\)\@=

" This is better than \> for path names because it allows to be
" followed by things like ;
"\([ "';]\|$\)\)\@=
 
" 1 Can't use unicode in python without declaring charset.
" i can do this though
" syntax match unicode "[^\d0-\d127]"

" start of line
"\(^\|│\||\)"

" wherever one of these \> is used a : should be used as well (so that
" tmux window search is highlighted properly
" \(\>\|:\)
"
" doing this induced serious lag
"%s/\\</\\(\\<\\|:\\)/gc

" don't split this into multiple functions because of precedence
" abort means the function will quit when an error is detected
"fun! GeneralSyntax() abort
"can't

"hi morediscrete cterm=NONE ctermbg=233 ctermfg=236
hi morediscrete cterm=NONE ctermfg=236 ctermbg=NONE

" The roman numerals were creating lag. Verified.
" Remember I also need to change this in inkpot.vim
fun! NumberSyntax()
    " real low priority
    "syntax match tests '[a-z]\+\([fb]g\)\@='
    "syntax match tests '\([fb]g\)\@<=[a-z]\+'

    " underscore
    "syntax match morediscrete "[a-z]\@<=_[a-z]\@="
    "syntax match morediscrete "[A-Z]\@<=_[A-Z]\@="
    "syntax match morediscrete "\c[0-9a-z ]\@<=_\+[0-9a-z]\@="

    " this wasnt really helpful, plus looked kinda bad sometimes
    " By default it should be discrete
    "syntax match morediscrete "_"

    " keep numbers after letters (for units [data and measurements] and
    " ordinal numbers)
    " keep letters before numbers (it's also extremely useful for, for
    " example dates like this 20160818054330UTC. better on than off for
    " sure)
    hi one cterm=NONE ctermfg=033 ctermbg=236
    "syntax match one "\s\?\(\a\d*\)\@<!\(\d*1\)\d\@!\a*\s\?"
    syntax match one "\c[a-f]*\(\d*1\)\d\@!\a*"
    " fails on this .ansi31, so not worth the expense
    "syntax match one "\c\([g-wyz][a-f]\?\)\@<![a-f]*\(\d*1\)\d\@!\a*"
    " for the bash spinner
    syntax match one "\[\@<=\\\]\@="
    syntax match one "\<GPGGA\>"
    " y is done under 'yes'
    " this can mean 10 or a coordinate
    " syntax match one "\<[XIVMC]\+I\>"
    syntax match one "\c\<one\>"
    " Don't do this
    "syntax match one "\c(\?\<[1a])"
    syntax match one "\c(\?\<[a])"
    syntax match one "\c\<jan\>"

    hi two cterm=NONE ctermfg=149 ctermbg=236
    "syntax match two "\(\a\d*\)\@<!\(\d*2\)\d\@!\a*\s\?"
    syntax match two "\c[a-f]*\(\d*2\)\d\@![a-z]*"
    syntax match two "\c[a-z]*\(\d*2\)\d\@![a-z]*\(_t\)\@="
    "syntax match two "\c\([g-wyz][a-f]\?\)\@<![a-f]*\(\d*2\)\d\@!\a*"
    " for the bash spinner
    syntax match two "\[\@<=/\]\@="
    syntax match two "\<GPGSA\>"
    syntax match two "\c\<two\>"
    " syntax match two "\c\<other\>"
    " syntax match two "\c\<alternat[a-z]\+\>"
    syntax match two "\c(\?\<[b])"
    syntax match two "\c\<feb\>"

    hi three cterm=NONE ctermfg=206 ctermbg=236
    "syntax match three "\s\?\(\a\d*\)\@<!\(\d*3\)\d\@!\a*\s\?"
    syntax match three "\c[a-f]*\(\d*3\)\d\@![a-z]*"
    "syntax match three "\c\([g-wyz][a-f]\?\)\@<![a-f]*\(\d*3\)\d\@!\a*"
    " for the bash spinner
    syntax match three "\[\@<=|\]\@="
    syntax match three "\<GPGSV\>"
    syntax match three "\c\<z\>"
    syntax match three "\c\<three\>"
    syntax match three "\c(\?\<[c])"
    syntax match three "\c\<mar\>"

    hi four cterm=NONE ctermfg=227 ctermbg=236
    "syntax match four "\s\?\(\a\d*\)\@<!\(\d*4\)\d\@!\a*\s\?"
    syntax match four "\c[a-f]*\(\d*4\)\d\@![a-z]*"
    syntax match four "\c[a-z]*\(\d*4\)\d\@![a-z]*\(_t\)\@="
    "syntax match four "\c\([g-wyz][a-f]\?\)\@<![a-f]*\(\d*4\)\d\@!\a*"
    " for the bash spinner
    syntax match four "\[\@<=-\]\@="
    syntax match four "\<GPRMC\>"
    syntax match four "\c\<four\>"
    syntax match four "\c(\?\<%\@<![d])"
    syntax match four "\c\<apr\>"

    hi five cterm=NONE ctermfg=161 ctermbg=236
    "syntax match five "\s\?\(\a\d*\)\@<!\(\d*5\)\d\@!\a*\s\?"
    syntax match five "\c\(h[a-f]*\)\@<![a-f]*h\@<!\(\d*5\)\d\@![a-z]*"
    "syntax match five "\c\(h[a-f]*\)\@<!\([g-wyz][a-f]\?\)\@<![a-f]*\(\d*5\)\d\@!\a*"
    syntax match five "\<V\>"
    syntax match five "\<five\>"
    syntax match five "\c(\?\<[e])"
    " syntax match five "\<[XIVMC]*V\>"
    syntax match five "\c\<may\>"

    hi six cterm=NONE ctermfg=214 ctermbg=236
    "syntax match six "\s\?\(\a\d*\)\@<!\(\d*6\)\d\@!\a*\s\?"
    syntax match six "\c[a-f]*\(\d*6\)\d\@![a-z]*"
    syntax match six "\c[a-z]*\(\d*6\)\d\@![a-z]*\(_t\)\@="
    "syntax match six "\c\([g-wyz][a-f]\?\)\@<![a-f]*\(\d*6\)\d\@!\a*"
    syntax match six "\<six\>"
    syntax match six "\c(\?\<[f])"
    " this is for functions as they appear in vim's complete menu
    syntax match six " \@<=f \@="
    syntax match six "\c\<jun\>"

    hi seven cterm=NONE ctermfg=075 ctermbg=236
    "syntax match seven "\s\?\(\a\d*\)\@<!\(\d*7\)\d\@!\a*\s\?"
    syntax match seven "\c[a-f]*\(\d*7\)\d\@![a-z]*"
    "syntax match seven "\c\([g-wyz][a-f]\?\)\@<![a-f]*\(\d*7\)\d\@!\a*"
    syntax match seven "\<seven\>"
    syntax match seven "\c(\?\<[g])"
    syntax match seven "\c\<jul\>"

    hi eight cterm=NONE ctermfg=204 ctermbg=236
    "syntax match eight "\s\?\(\a\d*\)\@<!\(\d*8\)\d\@!\a*\s\?"
    syntax match eight "\c[a-f]*\(\d*8\)\d\@![a-z]*"
    syntax match eight "\c[a-z]*\(\d*8\)\d\@![a-z]*\(_t\)\@="
    "syntax match eight "\c\([g-wyz][a-f]\?\)\@<![a-f]*\(\d*8\)\d\@!\a*"
    syntax match eight "\<eight\>"
    " syntax match eight "\<[XIVMC]*C\>"
    syntax match eight "\c(\?\<[h])"
    syntax match eight "\c\<aug\>"

    hi nine cterm=NONE ctermfg=049 ctermbg=236
    "syntax match nine "\s\?\(\a\d*\)\@<!\(\d*9\)\d\@!\a*\s\?"
    syntax match nine "\c[a-f]*\(\d*9\)\d\@![a-z]*"
    "syntax match nine "\c\([g-wyz][a-f]\?\)\@<![a-f]*\(\d*9\)\d\@!\a*"
    syntax match nine "\<nine\>"
    " syntax match nine "\<[XIVMC]*M\>"
    syntax match nine "\c(\?\<[i])"
    syntax match nine "\c\<sep\>"

    "hi zero cterm=NONE ctermfg=141 ctermbg=236
    hi zero cterm=NONE ctermfg=127 ctermbg=236
    "syntax match zero "\s\?\(\a\d*\)\@<!\(\d*0\)\d\@!\a*\s\?"
    syntax match zero "\c[a-f]*\(\d*0\)\d\@![a-z]*"
    "syntax match zero "\c\([g-wyz][a-f]\?\)\@<![a-f]*\(\d*0\)\d\@!\a*"
    syntax match zero "zero"
    " syntax match zero "\<[XIVMC]*X\>"
    syntax match zero "\c\<oct\>"

    syntax match one "\c\<nov\>"
    syntax match onlyhex "\c\<dec\>"

    hi onlyhex cterm=NONE ctermfg=149 ctermbg=236
    syntax match onlyhex "\c[a-z0-9]\@<![a-f]\{4,}[a-z0-9]\@!"
    " do not allow be, cd or def
    syntax match onlyhex "\c[a-z0-9]\@<![ae-f]\{2,}[a-z0-9]\@!"
endf

fun! GeneralSyntax()
    "" this  should go first because it has a low priority and
    "" therefore needs higher precedence
    ""hi singlewordline cterm=NONE ctermfg=097 ctermbg=none
    ""hi singlewordline cterm=NONE ctermfg=172 ctermbg=089
    "hi singlewordline cterm=NONE ctermfg=245 ctermbg=none
    "" must start with a capital letter
    "syntax match singlewordline "\(.*[a-zA-Z].*\)\@<!\<[A-Z][a-zA-Z]\+\>\(.*[a-zA-Z].*\)\@!"

    hi domainbright cterm=NONE ctermfg=250 ctermbg=236
    syntax match domainbright "\(\<www.\)\@<=[a-z]\+\(\.[a-z]\+\)\@="
    " doesnt' work
    syntax match domainbright "\(https\?:\/\/\([a-z-]\+\.\)*\)\@<=\([a-z0-9-]\+\)\(\.[a-z]\+\($\|[^a-z]\)\)\@="

    hi domain cterm=NONE ctermfg=243 ctermbg=236
    syntax match domain "\<www.\([a-z]\+\.[a-z]\+\)\@="

    " must come early i think
    hi numberpunctuation cterm=NONE ctermbg=236
    "syntax match numberpunctuation "\c[a-f0-9]\@<=[:-][a-f0-9]\@="
    "syntax match numberpunctuation "\c[a-f0-9]\@<=\([a-f0-9]\@<=[.][a-f0-9]\@=\)[a-f0-9]\@="

    " disable this
    "syntax match numberpunctuation "\c[a-f0-9]\@<=[:-][a-f0-9]\@="
    syntax match numberpunctuation "\c[0-9]\@<=[.][0-9]\@="
    syntax match numberpunctuation "\c[:]\@<=[a-f][a-f][:]\@="

    hi bullets ctermfg=247 ctermbg=236
    syntax match bullets "\c[^(]\@<![a-z][^)]\@!"

    hi allcaps cterm=NONE ctermfg=245
    """ must start with a capital letter
    "" allcapsline
    ""syntax match allcaps "\(.*[a-z].*\)\@<!\<[ _A-Z]\+\>\(.*[a-z].*\)\@!"
    "" all caps word
    "syntax match allcaps "\<[A-Z][_A-Z-]*[A-Z]s\?\(\([0-9]*\)\?\>\)\@="
    "syntax match allcaps "\(\(\<[A-Z][A-Za-z-]*\( [A-Za-z-]*\)\+\. \)*[\(\<[A-Z][A-Za-z-]* \?\)\+\(\<[A-Za-z-]\+ \?\)*::\@!"
    " plural s but also make some constants look nice
    syntax match allcaps "\(\<\|_\)\@<=[A-Z]\{2,\}\([a-z]\?\)\(\>\|_\|[0-9]\)\@="
    " a single capital letter followed by not a letter
    syntax match allcaps "\(\<\|_\)\@<=[A-Z]\([^A-Za-z]\(\>\|_\|[0-9]\)\)\@="

    hi currentProject cterm=NONE ctermfg=000 ctermbg=249
    "hi currentProject term=reverse cterm=reverse
    syntax match currentProject "PROJECTS/"

    syntax match currentProject "\<alias\>"

    "hi quote cterm=NONE ctermfg=249 ctermbg=234
    " Same colour as inkpot's 'Special'.
    hi quote cterm=NONE ctermfg=39 ctermbg=234
    syntax match quote "'"

    hi doublequote cterm=NONE ctermfg=244 ctermbg=234
    syntax match doublequote "\""

    hi gitRtcPackage cterm=NONE ctermfg=027 ctermbg=017
    syntax match gitRtcPackage "\(\(^\|│\||\) *\)\@<=modified   "
    syntax match gitRtcPackage "\<function\( [^ ]*(\|:\|\>\)\@="
    syntax match gitRtcPackage "\<func\>"
    syntax match gitRtcPackage "\<sub\>"
    syntax match gitRtcPackage "\<Function\>"
    syntax match gitRtcPackage "\<Sub\>"
    syntax match gitRtcPackage "\<proc\>"
    syntax match gitRtcPackage "\<defun\>"

    hi variable cterm=NONE ctermfg=041 ctermbg=236
    syntax match variable "\<var\(iable\)\?\>"
    syntax match variable "\<member\>"
    syntax match variable "\<my\>"
    syntax match variable "\<Dim\>"
    syntax match variable "\<Set\>"

    syntax match onlyhex "\<enum\>"

    hi module cterm=NONE ctermfg=041 ctermbg=022
    syntax match module "\<module:\@=""
    syntax match module "\<package\>"

    hi instance cterm=NONE ctermfg=164 ctermbg=054
    syntax match instance "\<instance:\@=""

    syntax match morediscrete "\<statement:\@="

    hi gitRtcPackage cterm=NONE ctermfg=027 ctermbg=017
    "syntax match gitRtcPackage "\(^\|│\||\)Entering '[a-z/A-Z-]\+'$"
    "syntax match gitRtcPackage "\(^\|│\||\)\@<=Entering\( '[a-z/A-Z-]\+'\)\@=$"
    syntax match gitRtcPackage "\(^\|│\||\)\@<=Entering"

    hi gitRtcError cterm=NONE ctermfg=161 ctermbg=052
    syntax match gitRtcError "\(^\|│\||\)Cannot \a\+:[a-z A-Z]\+\.$"
    syntax match gitRtcError "\c\(\w\+\)\?\<timed out\>"
    syntax match gitRtcError "\c\(\w\+\)\?\<core dumped\>"
    syntax match gitRtcError "\<rebasing\>"

    " pointless because no 'foobar' highlight red anyway
    "syntax match gitRtcError "\c\(\<no\> \)\@!PROBLEM"
    syntax match gitRtcError "\c\<problem\>"

    hi gdb cterm=NONE ctermfg=226 ctermbg=236
    "syntax match gdb "[^(]\@<!\(gdb\|InteractiveConsole\)[^)]\@!"
    syntax match gdb "\<\([sl]\?trace\|gdb\|InteractiveConsole\)\>"
    syntax match gdb  "DEBUG[^:]\@!"
    syntax match gdb  "unittest.skip"
    " qcl>
    syntax match gdb  " \@<! \@<=[a-z]\+> \@="

    syntax match gdb "\<ghci>"

    hi neosession cterm=NONE ctermfg=069 ctermbg=225
    syntax match neosession "\(^\|│\||\)NV \^\?[A-Za-z0-9-]\+\>"

    " Can't use these because they do not interact well with
    " columnated glossaries.
    "" Any lines with one of the following characters will be highlighted:
    "" Use BufWinEnter for maximum priority
    "" BufWinEnter gives priority to vimhelp and code
    "" BufEnter gives priority to mail
    "" VimEnter fixes difftool.sh HEAD\^:
    "hi myhighlightSplus cterm=NONE ctermfg=116 ctermbg=4
    "syntax match myhighlightSplus ".*ס.*" " ס S+

    "hi myhighlightQplus cterm=NONE ctermfg=34 ctermbg=121
    "syntax match myhighlightQplus ".*ק.*" " ק Q+

    "hi myhighlightHplus cterm=NONE ctermfg=171 ctermbg=7
    "syntax match myhighlightHplus ".*ה.*" " ה H+

    "hi myhighlightNpercent cterm=NONE ctermfg=228 ctermbg=22
    "syntax match myhighlightNpercent ".*ן.*" " ן N%

    "hi myhighlightPplus cterm=NONE ctermfg=210 ctermbg=237
    "syntax match myhighlightPplus ".*פ.*" " פ P+

    hi myhighlightResults cterm=NONE ctermfg=163 ctermbg=055
    "hi myhighlightResults cterm=NONE ctermfg=111 ctermbg=057
    syntax match myhighlightResults "\$RESULTSD" " show-results.sh

    " email -- this should come early so can be overriddn
    hi login cterm=NONE ctermfg=036 ctermbg=023
    syntax match login "\a\+@[a-z.-]\+" " hiltest@hil-node1 crown@nitrogen
    syntax match login "\(\a\+\)\@<=@[a-z.-]\+"

    " let diffadd take care of pluses
    hi startingSymbol cterm=NONE ctermfg=184 ctermbg=NONE
    syntax match startingSymbol "\(^\|│\)\@<=\(\[[A-Z]\+\]\)\? \?[<>$]\+\( \|$\) \@!"
    " this is for the interactive console
    syntax match startingSymbol "[>]\@<!>>>[>]\@!"
    syntax match startingSymbol "\<scala>"

    hi seleniumError cterm=NONE ctermfg=125 ctermbg=052
    syntax match seleniumError "\c\<\(can\)\?not\>"
    syntax match seleniumError "\c\<bad\>"
    syntax match seleniumError "\c\<\(wrong\|incorrect\)\>"
    " can't use \? because it would match want
    syntax match seleniumError "\c\<[a-z]\+n't\( [a-z]\+\)\?\>"
    syntax match seleniumError "\c\<dont\>"
    syntax match seleniumError "\<\a\+Error\>" " ERROR
    syntax match seleniumError "\<color:red\>" " ERROR
    syntax match seleniumError "\c\<\(could not\|couldn't\)\>"
    syntax match seleniumError "\c\<\(not [a-z]\+\)\>"
    syntax match seleniumError "\cerror[:s]\?"
    syntax match seleniumError "\c\([a-z]\+\)\?exceptions\?"
    syntax match seleniumError "\c\(\w\+ \)\?thrown"
    "syntax match seleniumError "\c\<no such\( \w\+\)\?\>"
    syntax match seleniumError "\creferenced before assignment"
    " because this exists for 'n', i need a 'p'
    " no
    syntax match gitbranch "\c\(\<set \)\@<=no\([a-z]\+\>\)\@="
    " syntax match tests "\c\(\<set no\)\@<=[a-z]\+\>"
    syntax match seleniumError "\c\[\@<=no[a-z]\+\]\@=\>"
    syntax match seleniumError "\c\<no\>\( [a-z]\+\)\?\( [a-z]\+\)\?\>"
    syntax match seleniumError "\c\<false\>"
    syntax match seleniumError "\c\<locked\>"
    syntax match seleniumError "\c\<ro\>" " read only
    syntax match seleniumError "\c\<read only\>" " read only
    syntax match seleniumError "\c\<n\(an\?\)\?\>"
    syntax match seleniumError "FIXME"
    syntax match seleniumError "\cis undefined"

    " undefined reference
    syntax match seleniumError "\c\(is \)\@<!undefined\( [a-z]\+\)\?"

    syntax match seleniumError "\<\(\w\+ \)\?behind\>"
    syntax match safe "\<\(\w\+ \)\?ahead of\>"
    syntax match safe "\<\(\w\+ \)\?ahead\( [0-9]\)\@="

    syntax match seleniumError "\c\(resource \)\?\([a-z]\+ \)\?unavailable"

    " overkill
    "syntax match seleniumError "\cdiffers"

    hi null cterm=NONE ctermfg=237 ctermbg=232
    syntax match null "\c\<null\>"

    hi generalError cterm=NONE ctermfg=197 ctermbg=052
    syntax match generalError "\c\<invalid \w\+\>"

    hi notideal cterm=NONE ctermfg=085 ctermbg=197
    " mark this as an error because I want to eliminate as many of
    " these as I can
    syntax match notideal "\<time.sleep([0-9.]\+)"

    " good
    hi success cterm=NONE ctermfg=083 ctermbg=236
    "syntax match success "\c\(not \)\@<!success\(\a\+\)\?\>"
    syntax match success "\c\<success\(\a\+\)\?\>"
    syntax match success "\c\<pass\(\a\+\)\?\>"
    syntax match success "\c\([a-z-.]\+\)\? exists"
    syntax match success "\c\<running\>"
    syntax match success "\c\<accepted\>"
    syntax match success "\c\<available\>"
    syntax match success "\<UP\>"
    syntax match success "\c\<OK\>"
    " doesn't work ✓
    "syntax match success "\%o23423"
    syntax match success "\c\<\(not \)\@<!connected\( to \([a-z]\+\)\?\)\?\>"

    syntax match success "\c\(not\)\@<!up.\?.\?to.\?date\>"
    syntax match success "\c\(not\)\@<!clean\>"

    
    syntax match safe "\<can be fast-forwarded\>"

    hi safe cterm=NONE ctermfg=045 ctermbg=236
    syntax match safe "\c\<n/a\>"
    syntax match safe "\c\<yes\>"
    syntax match safe "\c\<true\>"
    " overkill
    "syntax match safe "\cequals"
    " syntax match safe "\c\<cancel[a-z]*\>"
    syntax match safe "\c\<good\>"
    syntax match safe "\c\<rw\>"
    syntax match safe "\c\<allow\(ed\)\?\( from\)\?\>"
    " could also be part of xyz (so make stuff for y and z under
    " numbers)
    syntax match safe "\c\<y\>"
    " something for previous because 'n' exists
    syntax match safe "\c\<p\>"
    syntax match safe "\c\<\(not \)\@<!safe\>"
    syntax match safe "\c\<enabled\>"
    syntax match safe "\c\(not\|'t \)\@<!continued\?\>"
    syntax match safe "\c\<any\( [a-z-]\+\)\?\>"
    " thinking of making a now thing for this as 'open' may not be
    " 'safe'.
    syntax match safe "\c\<open\>"
    syntax match safe "\c\<return\>"
    syntax match safe "\c\<unclaimed\>"

    syntax match gitbranch "\c\<\(abort\|q\|exit\|died\?\)\>"
    syntax match safe "\c\<exit code\>"
    syntax match buildfiles "\c\<Starting [0-9a-z]\+test\>"

    " exiting is usually not good
    syntax match seleniumError "\c\<exiting\>"

    hi sshError cterm=NONE ctermfg=226 ctermbg=197
    syntax match sshError "Host key verification failed."
    syntax match sshError "\c\<\(\w\+ \)\?not found"
    syntax match sshError "\cunexpected\(ly\)\?"
    syntax match sshError "\c\<[a-z]\+ refused\>"
    syntax match sshError "\c\(connection \)\?closed\?\>"
    syntax match sshError "\csorry"
    " denied
    syntax match sshError "\c\([a-z]\+ \)\?den\(ied\|y\)\( from\)\?"

    syntax match sshError "\ckilled"
    syntax match sshError "unmerged"
    syntax match sshError "unknown"
    
    syntax match sshError "\cillegal \<[a-z]\+\>"

    hi buildError cterm=NONE ctermfg=226 ctermbg=197
    syntax match buildError "symbol lookup error"
    syntax match buildError "undefined symbol"

    "hi myhighlightSource cterm=NONE ctermfg=143 ctermbg=240
    hi testcase cterm=NONE ctermfg=213 ctermbg=237
    " this rejects .py intentionally
    syntax match testcase '\c\<\w\+(\w\+\.TestCase)'
    " This can make it look like success but there can be a later
    " return code that is not 0
    " so don't match to success syntax
    syntax match testcasebold "RETURN CODE:"

    hi testcasebold cterm=NONE ctermfg=239 ctermbg=213
    syntax match testcasebold '\cfuncname: \<test_\(\d\+\)\w\+\(\.\w\w\>\)\@!\(\.\w\w\w\+\)\?\>'

    hi crown cterm=NONE ctermfg=202 ctermbg=240
    """ syntax match crown '\(imm\|IMM\)'
    """ syntax match crown '\c\<NBO\(\>\|:\)'
    """ syntax match crown '\c\<RTC\(\>\|:\)'
    """ syntax match crown '\c\<RTMs\?\>'
    """ syntax match crown 'E\(BL\|bl\)'

    """ syntax match crown '\c\<ESR\>'

    " Visor replacement
    hi visorReplacement cterm=NONE ctermfg=009 ctermbg=018
    syntax match visorReplacement 'Α.\{-\}Ω' " capital alpha and capital omega

    " My Tools
    hi crownShane cterm=NONE ctermfg=047 ctermbg=092
    syntax match crownShane '\([^ ]\@<!;\)\@<=[a-z]*;\@='
    syntax match crownShane '\c\<qxm\>'
    syntax match crownShane '\c\<ixm\>'
    syntax match crownShane '\c\<cxd\>'
    syntax match crownShane '\c\<Query XML\>'
    syntax match crownShane '\c\<Information XML\>'
    syntax match crownShane '\c\<Crown XML Database\>'
    syntax match crownShane '\<log2ixm\>'
    syntax match crownShane '\<ixm2cxd\>'
    syntax match crownShane '\c\<tmux visualiser\>'
    syntax match crownShane '\ccroogle\(\>\|:\)'
    syntax match crownShane '\(^\|│\||\) *\~:'

    " allow elastic for emails
    syntax match crownShane '\c\<elastic\(.\?search\)\?\>'
    syntax match crownShane '\c\<es\>'
    syntax match crownShane '\c\<logstash\>'
    syntax match crownShane '\c\<arangodb\>'
    syntax match crownShane '\c\<prelert\>'
    syntax match crownShane '\<LS\>'
    syntax match crownShane '\<ELK\>'
    "syntax match crownShane '\c\<ls\>'
    syntax match crownShane '\c\<kibana\>'
    "syntax match crownShane '\c\<kb\>'

    " Vision
    hi crownVision cterm=NONE ctermfg=212 ctermbg=240
    syntax match crownVision '\c\<Vision\>'
    syntax match crownVision '\<OpenCV\>'

    " xpath/html/xhtml
    hi xpath cterm=NONE ctermfg=061 ctermbg=235
    syntax match xpath '\<id=\(\'\w\+\'\|"\w\+"\)'

    hi xpath2 cterm=NONE ctermfg=063 ctermbg=235
    syntax match xpath2 '\<class=\(\'\w\+\'\|"\w\+"\)'

    hi xpath3 cterm=NONE ctermfg=138 ctermbg=235
    syntax match xpath3 '\(\'\w\+\'\|"\w\+"\), \?By.\(ID\|XPATH\)'

    " Important hardware
    " Must come before packages (so hil-test-common doesn't get
    " highlighted HIL)
    hi importantHardware cterm=NONE ctermfg=162 ctermbg=054
    "syntax match importantHardware '\c\(\<\|[^_]\@<!\)hil\([_:-]nodes\?\)\?\(\>\|[^_0-9]\@!\)' " no getting around using the underscores without setting iskeyword
    "syntax match importantHardware '\c\(\<\|[^_]\@<!\)rtm\(\>\|[^_0-9]\@!\)' " no getting around using the underscores without setting iskeyword
    "this is a nice purple
    syntax match importantHardware '\cstart[a-z]\+'

    " builddep
    hi builddep cterm=NONE ctermfg=126 ctermbg=220
    syntax match builddep '\c\<builddep\>'

    " Messaging
    hi crownMessaging cterm=NONE ctermfg=136 ctermbg=240
    syntax match crownMessaging '\c\<Messaging\>'

    " VehicleCalibration
    "hi crownVehicleCalibration cterm=NONE ctermfg=156 ctermbg=240
    hi crownVehicleCalibration cterm=NONE ctermfg=158 ctermbg=240
    syntax match crownVehicleCalibration '\c\<Vehicle \?Calibration\>'

    " These don't really need regex
    "" Busybox lsof Threads
    "hi crownThread cterm=NONE ctermfg=206 ctermbg=240
    "syntax match crownThread '\<OdometryC\>'
    "syntax match crownThread '\<Hdf5Appen\>'
    "syntax match crownThread '\<CanReader\>'
    "syntax match crownThread '\<CanWriter\>'
    "syntax match crownThread '\<Calibrati\>'
    "syntax match crownThread '\<ImuCalibr\>'
    "VehicleIn
    "CanInterf

    """ " VehicleInterface
    """ hi crownVehicleInterface cterm=NONE ctermfg=146 ctermbg=240
    """ syntax match crownVehicleInterface '\c\<Vehicle[ -]\?Interface\>'
    """ syntax match crownVehicleInterface '\c\<VLINTERFACE\>'

    """ " CameraInterface
    """ hi crownCameraInterface cterm=NONE ctermfg=214 ctermbg=240
    """ syntax match crownCameraInterface '\c\<Camera[ -]\?Interface\>'
    """ syntax match crownCameraInterface '\c\<CAMERAINT\>'

    """ " CanInterface
    """ hi crownCanInterface cterm=NONE ctermfg=122 ctermbg=240
    """ syntax match crownCanInterface '\c\<Can[ -]\?Interface\>'
    """ syntax match crownCanInterface '\c\<CANINT\>'

    """ " IntegrationTests
    """ hi crownIntegrationTests cterm=NONE ctermfg=037 ctermbg=240
    """ syntax match crownIntegrationTests '\c\<Integration \?Tests\>'

    """ " dualModeControl
    """ hi dualModeControl cterm=NONE ctermfg=207 ctermbg=240
    """ syntax match dualModeControl '\c\<dual \?Mode \?Control\>'

    """ " utils
    """ hi utils cterm=NONE ctermfg=035 ctermbg=240
    """ syntax match utils '\c\<utils\>'

    """ " Configuration
    """ hi crownConfiguration cterm=NONE ctermfg=183 ctermbg=240
    """ syntax match crownConfiguration '\c\<Configuration\>'

    """ " Core
    """ hi crownCore cterm=NONE ctermfg=165 ctermbg=240
    """ syntax match crownCore '\c\<Core\>'

    """ " Logging
    """ hi crownLogging cterm=NONE ctermfg=190 ctermbg=240
    """ syntax match crownLogging '\c\<Logging\>'

    """ " Imu
    """ hi crownImu cterm=NONE ctermfg=197 ctermbg=240
    """ syntax match crownImu '\c\<Imu\>'

    """ " GeoReporting
    """ hi crownGeoReporting cterm=NONE ctermfg=039 ctermbg=240
    """ syntax match crownGeoReporting '\c\<Geo[ -]\?Reporting\>'

    """ " HilTestCommon
    """ hi crownHilTestCommon cterm=NONE ctermfg=228 ctermbg=240
    """ syntax match crownHilTestCommon '\c\<Hil-\?Test-\?Common\>'

    """ " scripts
    """ hi crownScripts cterm=NONE ctermfg=167 ctermbg=240
    """ syntax match crownScripts '\c\<scripts\>'
    """ syntax match crownScripts '\c\<integration\>'

    """ " Localisation
    """ hi crownLocalisation cterm=NONE ctermfg=047 ctermbg=240
    """ syntax match crownLocalisation '\c\<\(Environment Based \)\?locali[sz]ation\>'
    """ syntax match crownLocalisation '\c\<Very Narrow Isles\>' " VNA
    """ syntax match crownLocalisation '\c\<VNA\>' " VNA
    """ syntax match crownLocalisation '\<[Oo]dometry\>'
    """ syntax match crownLocalisation '\<[Cc]lothoid\>'
    """ syntax match crownLocalisation '\c\<EBL\>'
    """ syntax match crownLocalisation '\c\<Env\(ironmental\)\? \?Localisation\>'
    """ syntax match crownLocalisation '\c\<DMTR\>'
    """ syntax match crownLocalisation '\<GA\>'
    """ syntax match crownLocalisation '\c\<dual\([ -]\?\(mode\)\)\>'
    """ syntax match crownLocalisation '\(\<[A-Z5_]\+\)\@<=_MODE\>'
    """ syntax match crownLocalisation '\<[A-Z5_]\+\(_MODE\>\)\@='
    """ syntax match crownLocalisation '\<MODE_[A-Z5_]\+\>'
    """ syntax match crownLocalisation '\c\<LOCENVLOC\>'
    """ syntax match crownLocalisation '\c\<CAMC\>'

    """ " Jira
    """ hi crownIssue cterm=NONE ctermfg=163 ctermbg=055
    """ syntax match crownIssue '\(ISS\|SM\|GA\|EBL\|IMM\|IMMDU\)-\d\{3,}'
    """ syntax match crownIssue "[^ /]* \?\(ISS\|SM\|GA\|EBL\|IMM\)-\(\d\|?\)\{2,}$"

    """ hi crownIssueDMTR cterm=NONE ctermfg=093 ctermbg=055
    """ syntax match crownIssueDMTR '\(DMTR\)-\d\{3,}'
    """ syntax match crownIssueDMTR "[^ /]* \?\(DMTR\)-\(\d\|?\)\{2,}$"

    """ hi crownIssueTOF cterm=NONE ctermfg=063 ctermbg=055
    """ syntax match crownIssueTOF '\(TOF\)-\d\{1,}'
    """ syntax match crownIssueTOF "[^ /]* \?\(TOF\)-\(\d\|?\)\{1,}$"

    """ syntax match crownIssueTOF "\c\<[a-z]\+ perception\>"

    """ hi crownIssueRDSP cterm=NONE ctermfg=197 ctermbg=055
    """ syntax match crownIssueRDSP '\(RDSP\)-\d\{3,}'
    """ syntax match crownIssueRDSP "[^ /]* \?\(RDSP\)-\(\d\|?\)\{2,}$"

    """ " Crown Terms
    """ syntax match crown '\c\<OD\>'
    """ syntax match crown '\c\<Obstacle Detection\>'
    """ syntax match crown '\c\<HFL\>'
    """ syntax match crown '\c\<VDL\>'
    """ syntax match crown '\c\<WMS\>'
    """ syntax match crown '\c\<Warehouse Management System\>'
    """ syntax match crown '\c\<opkg\>'

    hi importantFile cterm=NONE ctermfg=162 ctermbg=NONE
    syntax match importantFile '\c\<syslog\>'
    syntax match importantFile '\c\<auth.log\>'

    """ " Hardware
    """ syntax match crown '\c\<[VSTOHA]CM\>'
    """ syntax match crown '\c\<DSP[12]\?\>'
    """ syntax match crown '\c\<IHM\>'
    """ syntax match crown '\c\<UIM\>'
    """ syntax match crown '\c\<KYS\>'
    """ syntax match crown '\c\<DM\>'
    """ syntax match crown '\c\<ATOM\>'
    """ syntax match crown '\c\<\w\+\> \<\(Hardware\|Control\|Interface\) Module\>'
    """ syntax match crown '\c\<Display Module\>'
    """ syntax match crown '\c\<infolink\>\( box\)\?'
    """ syntax match crown '\c\<Munich\>'
    """ syntax match crown '\<eblApp\>'
    """ syntax match crown '\c[Cc]rown\(lift\)\?\>'
    """ syntax match crown '\c\<Crown Equipment\>\( Limited\| Ltd\| Corp\(oration\)\?\)\?\>'
    """ syntax match crown '\cCompanion \?Cube'
    """ syntax match crown '\cPreserve \?Logs\?'
    """ syntax match crown '\<site-builder\>'
    """ syntax match crown '\c\<infosphere\>'
    """ syntax match crown '\c\<service[ -]mode\>'
    """ syntax match crown '\c\<rtc\>'
    """ syntax match crown '\c\<LogPutter\>'
    """ syntax match crown '\c\<crowncontroller\>'
    """ syntax match crown '\c\<Fused[ \-]\?Odom\(etry\)\?\>'
    """ syntax match crown '\c\<\(Hil \?\)\?Log \?Player\>'
    """ syntax match crown '\<[Nn]ative\>'
    """ syntax match crown '\<[Tt]imesys\>'
    """ syntax match crown '\<[Ii]ntrinsics\>'
    """ syntax match crown '\c\<fake \?\(Truck\|Imu\)\(Dsp\)\?\>'
    """ syntax match crown '\c\(DISPLAY\|FAKE\)[ _]\?CAM\(ERA\)\?\>'

    """ " VIPs
    """ hi vip cterm=NONE ctermfg=222 ctermbg=130
    """ syntax match vip "\c\<Lew\>\([\- .]Manci\)\?[\a]\@!"
    """ syntax match vip "\c\<Mike\>\([\- .]Gallagher\)\?[\a]\@!"
    """ syntax match vip "\c\<Tim\>\([\- .]Quellhorst\|[\- ]Wellman\)\?\([\a]\|[\- ]F\(anselow\)\?\)\@!"
    """ syntax match vip '\c\<\(Phil\|TQ\|TW\|VP\|LM\|MG\|timq\|timw\)\>'

    """ " Tim Fanselow
    """ hi timf cterm=NONE ctermfg=091 ctermbg=177
    """ syntax match timf "\c\<Tim\>[\- .]F\(anselow\)\?[\a]\@!"
    """ syntax match timf "\ctfanselo"

    """ " RTC Staff
    hi kashyap cterm=NONE ctermfg=041 ctermbg=022 " also used for other things
    """ syntax match kashyap "\c\<chandrasekar\>"
    """ syntax match kashyap "\c\<Kashyap\>\([\- .]Chandrasekar\)\?[\a]\@!" " Kashyap Chandrasekar
    """ syntax match kashyap "\ckchandra"

    "hi me cterm=NONE ctermfg=076 ctermbg=017
    "hi me cterm=NONE ctermfg=155 ctermbg=236
    "hi me cterm=NONE ctermfg=009 ctermbg=019
    "hi me cterm=NONE ctermfg=196 ctermbg=019
    "hi me cterm=NONE ctermfg=027 ctermbg=197
    "hi me cterm=NONE ctermfg=197 ctermbg=027
    "hi me cterm=NONE ctermfg=124 ctermbg=111
    hi me cterm=NONE ctermfg=204 ctermbg=027
    syntax match me "\c\<Shane\>\([\- .]Mulligan\)\?[\a]\@!" " Shane Mulligan
    syntax match me "\c\<Laria\>\([\- .]Reynolds\)\?[\a]\@!" " Laria Reynolds
    syntax match me "\c\<Melee\>\([\- .]Dowle\)\?[\a]\@!" " Melee Dowle
    syntax match me "\c\<Megan\>\([\- .]Goodwin\)\?[\a]\@!" " Megan Goodwin
    syntax match me "\c\<Kiana\>\([\- .]Adams\)\?[\a]\@!" " Kiana Adams
    syntax match me "\csmulliga"
    syntax match me "\c\<JOB\>"
    syntax match me "\clibertyprime"

    hi mebot cterm=NONE ctermfg=027 ctermbg=204
    syntax match mebot "\clibertyprimebot"

    """ " unknown crown developers/people
    """ syntax match crown '\c\<Alex Kozlov\>'
    """ syntax match crown '\<tchen\>'
    """ syntax match crown '\<akozlov\>'
    """ syntax match crown '\c\<Jamie Bell\>'
    """ syntax match crown '\<jbell\>'

    """ " Generic Mark
    """ syntax match crown '\c\<Mark\(B[\a]\@!\|Bell\|W[\a]\@!\|Walbran\)\@!\>'

    """ hi markbell cterm=NONE ctermfg=111 ctermbg=025
    """ syntax match markbell "\c\<Mark\>\([\- .]B\(ell\)\?\)[\a]\@!" " Mark Bell
    """ syntax match markbell "\cmbell"
    """ syntax match markbell "\c\<CFE\>"
    """ syntax match markbell "\c\<Camera \?Feature \?Extraction\>"

    """ hi markwalbran cterm=NONE ctermfg=045 ctermbg=024
    """ syntax match markwalbran "\c\<Mark\>\([\- .]W\(albran\)\?\)[\a]\@!" " Mark Walbran
    """ syntax match markwalbran "\cmwalbran"

    """ " Generic David
    """ syntax match crown '\c\<David\(B[\a]\@!\|Moore\|W[\a]\@!\|Robinson\)\@!'
    """ syntax match crown '\c\<Robinson\>'

    """ hi davidmoore cterm=NONE ctermfg=245 ctermbg=220
    """ syntax match davidmoore "\c\<David\>\([\- .]M\(oore\)\?\)[\a]\@!" " David Moore
    """ syntax match davidmoore "\cdmoore"

    """ hi davidrobinson cterm=NONE ctermfg=057 ctermbg=141
    """ syntax match davidrobinson "\c\<David\>\([\- .]R\(obinson\)\?\)[\a]\@!" " David Robinson
    """ syntax match davidrobinson "\cdrobinso"

    """ " Ryan's Feature Reducing

    """ "hi carl cterm=NONE ctermfg=015 ctermbg=197 " too similar to yolanda
    """ "hi carl cterm=NONE ctermfg=009 ctermbg=053 " yolanda's old colur
    """ hi carl cterm=NONE ctermfg=196 ctermbg=053 " yolanda's old colur
    """ syntax match carl "\c\<Carl\>\([\- .]Morgan\)\?[\a]\@!" " Carl Morgan
    """ syntax match carl "\cc\?morgan"

    """ hi sam cterm=NONE ctermfg=050 ctermbg=067
    """ syntax match sam "\c\<Sam\>\([\- .]McArdle\)\?[\a]\@!" " Sam McArdle
    """ syntax match sam "\cgazebo"
    """ syntax match sam "\csmcardle"
    """ syntax match sam "\cpylon"

    """ hi jacob cterm=NONE ctermfg=050 ctermbg=036
    """ syntax match jacob "\c\<Jacob\>\([\- .]Thomson\)\?[\a]\@!" " Jacob Thomson
    """ syntax match jacob "\cjthomson"
    """ "syntax match sam "\csmcardle"

    """ hi amitphilip cterm=NONE ctermfg=077 ctermbg=240
    """ syntax match amitphilip "\c\<philip\>"
    """ syntax match amitphilip "\c\<Amit\?\>\([\- .]Philip\)\?[\a]\@!" " Amit Philip
    """ syntax match amitphilip "\caphilip"
    """ syntax match amitphilip '\c\<SLAM\>'

    """ hi benji cterm=NONE ctermfg=226 ctermbg=237
    """ syntax match benji "\c\<Ben\(ji\)\?\>\([\- .]Morelli\)\?[\a]\@!" " Benji
    """ syntax match benji "\cbmorelli"

    """ " hi wsember cterm=NONE ctermfg=226 ctermbg=237
    """ syntax match crown "\c\<Will\(iam\)\?\>\([\- .]Sember\)\?[\a]\@!" " William Sember
    """ syntax match crown "\cwsember"
    """ 
    """ " hi sdai cterm=NONE ctermfg=226 ctermbg=237
    """ syntax match crown "\c\<Shirlgey\>\([\- .]Dai\)\?[\a]\@!" " Shirley Dai
    """ syntax match crown "\csdai"
    """ 
    """ " hi bmccroskey cterm=NONE ctermfg=226 ctermbg=237
    """ syntax match crown "\c\<Bill\>\([\- .]McCroskey\)\?[\a]\@!" " Bill McCroskey
    """ syntax match crown "\cbmccroskey"

    """ hi eleanordafonseca cterm=NONE ctermfg=142 ctermbg=237
    """ syntax match eleanordafonseca "\c\<Eleanor\>\([\- .]Da Fonseca\)\?[\a]\@!" " Eleanor Da Fonseca
    """ syntax match eleanordafonseca "\c\<E Da Fonseca\>[\a]\@!" " Eleanor Da Fonseca
    """ syntax match eleanordafonseca "\cedafonse"

    hi hannah cterm=NONE ctermfg=142 ctermbg=237
    syntax match hannah "\c\<Hannah\>\( Clark[\- .]Younger\)\?[\a]\@!"

    """ hi zacharymoller cterm=NONE ctermfg=142 ctermbg=130
    """ syntax match zacharymoller "\c\<Zach\(ary\)\?\>\( Moller\)\?[\a]\@!" " Zachary Moller
    """ syntax match zacharymoller "\czmoller"
    """ 
    """ hi josualogito cterm=NONE ctermfg=154 ctermbg=22
    """ syntax match josualogito "\c\<\(Josua\|Josh\)\>\( Logito\)\?[\a]\@!" " Josua Logito
    """ syntax match josualogito "\cjlogito"

    """ hi vadimfuchs cterm=NONE ctermfg=063 ctermbg=237
    """ syntax match vadimfuchs "\c\<Vadim\>\([\- .]Fuchs\)\?[\a]\@!" " Vadim Fuchs
    """ syntax match vadimfuchs "\cvfuchs"

    """ hi bendeeming cterm=NONE ctermfg=041 ctermbg=237
    """ syntax match bendeeming "\c\<Benjamin\?\>\([\- .]Deeming\)\?[\a]\@!" " Ben Deeming
    """ syntax match bendeeming "\c\<Ben Deeming[\a]\@!"
    """ syntax match bendeeming "\cbdeeming"

    hi toby cterm=NONE ctermfg=255 ctermbg=059
    """ syntax match toby "\c\<Collett\>"
    """ syntax match toby "\c\<Toby\>\([\- .]Collett\)\?[\a]\@!" " Toby Collett
    """ "syntax match toby "\c\<Toby\>"
    """ syntax match toby "\ctcollett"

    """ hi will cterm=NONE ctermfg=185 ctermbg=027
    """ syntax match will "\c\<Sember\>"
    """ syntax match will "\c\<William\>\([\- .]Sember\)\?[\a]\@!" " William Sember
    """ syntax match will "\cwsember"

    """ hi jenkins cterm=NONE ctermfg=255 ctermbg=059
    """ syntax match jenkins "\c\<jenkins\>"
    """ syntax match jenkins "\c\<hiltest\>"

    """ "hi andrewpaxie cterm=NONE ctermfg=117 ctermbg=019
    """ hi andrewpaxie cterm=NONE ctermfg=117 ctermbg=063
    """ "hi andrewpaxie cterm=NONE ctermfg=117 ctermbg=062
    """ syntax match andrewpaxie "\c\<Andrew\>\([\- .]Paxie\)\?[\a]\@!" " Andrew Paxie
    """ syntax match andrewpaxie "\capaxie"

    """ " Generic Chris
    """ syntax match crown '\c\<Chris\(B[\a]\@!\|Beaumont\|L[\a]\@!\|Lamb\)\@!\>'

    """ hi cbeaumont cterm=NONE ctermfg=255 ctermbg=056
    """ syntax match cbeaumont "\c\<Chris\>\([\- .]B\(eaumont\)\?\)[\a]\@!\>" " Chris Beaumont
    """ syntax match cbeaumont "\ccbeaumon"

    """ hi clam cterm=NONE ctermfg=255 ctermbg=126
    """ syntax match clam "\c\<lamb\>"
    """ syntax match clam "\c\<Chris\(topher\)\?\>\([\- .]L\(amb\)\?\)[\a]\@!\>" " Chris Lamb
    """ syntax match clam "\cclamb"

    """ "hi clam cterm=NONE ctermfg=255 ctermbg=126
    """ "syntax match clam "\c\<Chris L[\a]\@!" " Chris Lamb
    """ "
    """ "hi cbeaumont cterm=NONE ctermfg=255 ctermbg=056
    """ "syntax match cbeaumont "\c\<Chris B[\a]\@!" " Chris Beaumont

    """ hi jacquie cterm=NONE ctermfg=079 ctermbg=238
    """ syntax match jacquie "\c\<lewis\>"
    """ syntax match jacquie "\c\<Jacqueline\>\([\- .]Lewis\)\?[\a]\@!" " Jacqueline Lewis
    """ syntax match jacquie "\cjlewis"

    """ syntax match jacquie "\ctimesheets\?"

    """ hi joy cterm=NONE ctermfg=171 ctermbg=238
    """ syntax match joy "\c<young\>"
    """ syntax match joy "\c\<Joylene\>\([\- .]Young\)\?[\a]\@!" " Joylene Young
    """ syntax match joy "\cjyoung"

    """ hi jeanine cterm=NONE ctermfg=171 ctermbg=238
    """ syntax match jeanine "\c\<fleming\>"
    """ syntax match jeanine "\c\<Jeanine\>\([\- .]Fleming\)\?[\a]\@!" " Jeanine Fleming
    """ syntax match jeanine "\cjfleming"

    " hi lispfunction cterm=NONE ctermfg=240 ctermbg=234
    " hi lispfunction cterm=NONE ctermfg=058 ctermbg=190
    " syntax match lispfunction "\c(\@<=[a-z-]\+[ )]\@=" " toby and kashyap syntax are used for lisp

    hi kefin cterm=NONE ctermfg=216 ctermbg=098
    syntax match kefin "\c\<kefin[\a]\@!"

    hi ircfriends cterm=NONE ctermfg=098 ctermbg=216
    syntax match ircfriends "\c\<aidalgol[\a]\@!"
    syntax match ircfriends "\c\<technomancy[\a]\@!"
    syntax match ircfriends "\c\<bpalmer[\a]\@!"

    hi lexilambda cterm=NONE ctermfg=103 ctermbg=056
    syntax match lexilambda "\c\<lexi-lambda[\a]\@!"

    hi mp3foley cterm=NONE ctermfg=077 ctermbg=026
    syntax match mp3foley "\c\<mp3foley[\a]\@!"

    hi arleen cterm=NONE ctermfg=002 ctermbg=022
    syntax match arleen "\c\<Arleen\([\- .]Donaldson\)\?[\a]\@!" " Arleen Donaldson

    """ hi abigail cterm=NONE ctermfg=171 ctermbg=7
    """ syntax match abigail "\c\<Abigail\([\- .]Birkin-\?Hall\)\?[\a]\@!" " Abigail Birkin-Hall
    """ "syntax match abigail "\claser\( feature extraction\)\?"
    """ syntax match abigail "\c\<LASER\>"
    """ syntax match abigail "\c\/\@<=\<LASER\>\/\@="
    """ syntax match abigail "\claser feature extraction"
    """ syntax match abigail "\c\<LFE\>"
    """ syntax match abigail "\cabirkinh"

    """ hi yuan cterm=NONE ctermfg=148 ctermbg=028
    """ syntax match yuan "\c\<Yuan\>\([\- .]Mai\)\?[\a]\@!" " Yuan Mai
    """ syntax match yuan "\cymai"

    """ hi cooper cterm=NONE ctermfg=120 ctermbg=065
    """ syntax match cooper "\c\<Cooper\>\([\- .]Li\)\?[\a]\@!" " Cooper Li
    """ " we must allow _ so can't use \a
    """ syntax match cooper "\<cli[a-zA-Z-]\@!"

    """ hi gregsumner cterm=NONE ctermfg=069 ctermbg=055
    """ syntax match gregsumner "\c\<sumner"
    """ syntax match gregsumner "\c\<Greg\>\([\- .]Sumner\)\?[\a]\@!" " Greg Sumner
    """ syntax match gregsumner "\c\<gsumner"

    """ hi rachmcadam cterm=NONE ctermfg=209 ctermbg=124
    """ syntax match rachmcadam "\c\<\(Rachel\|Rach\)\>\([\- .]McAdam\)\?[\a]\@!" " Rachel McAdam
    """ syntax match rachmcadam "\crmcadam"

    """ hi ryan cterm=NONE ctermfg=117 ctermbg=098
    """ syntax match ryan "\c\<Ryan\>\([\- .]Estep\)\?[\a]\@!" " Ryan Estep
    """ syntax match ryan "\crestep"

    """ hi ralf cterm=NONE ctermfg=147 ctermbg=053
    """ syntax match ralf "\c\<Ralf\>\([\- .]Haeusler\)\?[\a]\@!" " Ralf Haeusler
    """ syntax match ralf "\crhaeusle"

    """ hi tony cterm=NONE ctermfg=029 ctermbg=147
    """ syntax match tony "\c\<Tony\>\([\- .]Fu\)\?[\a]\@!" " Tony Fu
    """ syntax match tony "\c\<tfu\>"

    """ hi justin cterm=NONE ctermfg=209 ctermbg=162
    """ syntax match justin "\c\<Justin\>\([\- .]Thode\)\?[\a]\@!" " Justin Thode
    """ syntax match justin "\cjthode"

    """ hi jessdonnelly cterm=NONE ctermfg=159 ctermbg=248
    """ syntax match jessdonnelly "\c\<Jess\>\([\- .]Donnelly\)\?[\a]\@!" " Jess Donnelly
    """ syntax match jessdonnelly "\cjdonnell"

    """ hi amanmehta cterm=NONE ctermfg=146 ctermbg=103
    """ syntax match amanmehta "\c\<Aman\>\([\- .]Mehta\)\?[\a]\@!" " Aman Mehta
    """ syntax match amanmehta "\camehta"

    """ hi ruthmitchener cterm=NONE ctermfg=171 ctermbg=181
    """ syntax match ruthmitchener "\c\<Ruth\>\([\- .]Mitchener\)\?[\a]\@!" " Ruth Mitchener
    """ syntax match ruthmitchener "\crmitchen"

    """ hi callum cterm=NONE ctermfg=020 ctermbg=251
    """ syntax match callum "\c\<Callum\>\([\- .]Robinson\)\?[\a]\@!" " Callum Robinson
    """ syntax match callum "\ccrobinso"

    """ hi stuartpark cterm=NONE ctermfg=045 ctermbg=065
    """ syntax match stuartpark "\c\<Stuart\>\([\- .]Park\)\?[\a]\@!" " Stuart Park
    """ syntax match stuartpark "\cspark"

    """ hi lisawong cterm=NONE ctermfg=105 ctermbg=044
    """ syntax match lisawong "\c\<Lisa\>\([\- .]Wong\)\?[\a]\@!" " Lisa Wong
    """ syntax match lisawong "\clwong"

    """ hi nicholasgadd cterm=NONE ctermfg=012 ctermbg=228
    """ "hi nicholasgadd cterm=NONE ctermfg=021 ctermbg=228
    """ "hi nicholasgadd cterm=NONE ctermfg=228 ctermbg=012
    """ syntax match nicholasgadd "\c\<gadd\>"
    """ syntax match nicholasgadd "\c\<\(Nicholas\|Nick\)\>\([\- .]Gadd\)\?[\a]\@!" " Nicholas Gadd
    """ syntax match nicholasgadd "\cngadd"

    """ hi karanpurohit cterm=NONE ctermfg=250 ctermbg=094
    """ syntax match karanpurohit "\c\<purohit\>"
    """ syntax match karanpurohit "\c\<Karan\>\([\- .]Purohit\)\?[\a]\@!" " Karan Purohit
    """ syntax match karanpurohit "\ckpurohit"

    """ hi tianxu cterm=NONE ctermfg=158 ctermbg=096
    """ syntax match tianxu "\c\<Tian\>\([\- .]Xu\)\?[\a]\@!" " Tian Xu
    """ syntax match tianxu "\ctxu"
    """ syntax match tianxu "\<Xu\>"

    """ hi thomasgumpp cterm=NONE ctermfg=129 ctermbg=090
    """ syntax match thomasgumpp "\c\<Thomas\>\([\- .]Gumpp\)\?[\a]\@!" " Thomas Gumpp
    """ syntax match thomasgumpp "\ctgumpp\d\?"

    """ hi sianphillips cterm=NONE ctermfg=042 ctermbg=023
    """ syntax match sianphillips "\c\<phillips\>"
    """ syntax match sianphillips "\c\<Sian\>\([\- .]Phillips\)\?[\a]\@!" " Sian Phillips
    """ syntax match sianphillips "sphillip"
    """ syntax match sianphillips "\c\<tof\>"

    """ hi alanstewart cterm=NONE ctermfg=215 ctermbg=166
    """ syntax match alanstewart "\c\<Alan\>\([\- .]Stewart\)\?[\a]\@!" " Alan Stewart
    """ syntax match alanstewart "astewart"

    """ "tracmap colours
    """ hi johnzhang cterm=NONE ctermfg=190 ctermbg=034
    """ syntax match johnzhang "\<Zhang\>"
    """ syntax match johnzhang "\c\<John\>\([\- .]Zhang\)\?[\a]\@!" " John Zhang
    """ syntax match johnzhang "zjohn"

    """ "hi theo cterm=NONE ctermfg=190 ctermbg=034
    """ "syntax match theo "\<Siew\>"
    """ "syntax match theo "\c\<Kelly\>\([\- .]Siew\)\?[\a]\@!" " Kelly Siew
    """ "syntax match theo "skelly"

    """ hi kellysiew cterm=NONE ctermfg=190 ctermbg=034
    """ syntax match kellysiew "\<Siew\>"
    """ syntax match kellysiew "\c\<Kelly\>\([\- .]Siew\)\?[\a]\@!" " Kelly Siew
    """ syntax match kellysiew "skelly"

    """ hi melodyfarishta cterm=NONE ctermfg=190 ctermbg=034
    """ syntax match melodyfarishta "\<Farishta\>"
    """ syntax match melodyfarishta "\c\<Melody\>\([\- .]Farishta\)\?[\a]\@!" " Melody Farishta
    """ syntax match melodyfarishta "fmelody"
    """ 
    """ hi theodrissnerdevine cterm=NONE ctermfg=190 ctermbg=034
    """ syntax match theodrissnerdevine "\c\<Drissner.\?Devine\>"
    """ syntax match theodrissnerdevine "\c\<Theo\(.\?\<Drissner.\?Devine\)\?\>" " Theo Drissner-Devine
    """ syntax match theodrissnerdevine "dtheo"

    """ hi kitbishop cterm=NONE ctermfg=190 ctermbg=034
    """ syntax match kitbishop "\<Bishop\>"
    """ syntax match kitbishop "\c\<Kit\>\([\- .]Bishop\)\?[\a]\@!" " Kit Bishop
    """ syntax match kitbishop "bkit"

    """ hi junli cterm=NONE ctermfg=222 ctermbg=162
    """ syntax match junli "\c\<Junli\>\([\- .]Tao\)\?[\a]\@!" " Junli Tao
    """ syntax match junli "\cjtao"

    """ " Good color
    """ "hi xuan cterm=NONE ctermfg=007 ctermbg=204
    """ "she no longer likes pink
    """ "hi xuan cterm=NONE ctermfg=250 ctermbg=007
    """ "sho likes baby pink now
    """ "" exactly what she likes
    """ hi xuan cterm=NONE ctermfg=218 ctermbg=255
    """ syntax match xuan "\c\<\(Xuan\|Yolanda\)\>\([\- .]Gao\)\?[\a]\@!" " Xuan Gao
    """ syntax match xuan "\cygao"

    """ " must come before
    """ syntax match subdued "\<ssh\>"
    """ hi saeid cterm=NONE ctermfg=204 ctermbg=7
    """ syntax match saeid "\c\<Saeid\>\([\- .]Shahosseini\)\?[\a]\@!" " Saeid Shahosseini
    """ syntax match saeid "\csshahoss"

    
" Zapp Brannigan
" Kif Kroker
" Smitty (Officer Smith, futurama)
" Crushinator (robot from futurama)
" Pickles (robot from futurama)
" Snarl ?
" Cardinal ?

    """ " Trucks
    """ hi trucks cterm=NONE ctermfg=141 ctermbg=018
    """ "syntax match trucks "\c\(\<\|[-_]\)\(Snarl\|Zapp\|Crushinator\|Leela\|Kroker\|Kiwi\|Cardinal\|Smitty\|Pickles\|Nibbler\|Bender\)\(\>\|[-_]\)" " Named
    """ syntax match trucks "\c\(\<\|[-_]\)\(Snarl\|Zapp\|Crushinator\|Leela\|Kroker\|Kiwi\|Cardinal\|Smitty\|Pickles\|Nibbler\|Bender\)\(\>\|[-]\)" " Named
    """ " dont let it end with a _ (so _hil is also hilighted

    """ hi servers cterm=NONE ctermfg=141 ctermbg=018
    """ syntax match servers "\c\(nitrogen\)"

    """ " need to barr quotes to prevent affecting pythonif "TSP" in truckModel:
    """ " can't be bothered fixing it, it's ugly anyway and breaks everywhere
    """ "syntax match trucks "\c[^']\(\<\|[-_]\)[^"']\(tsp\|t\|tc\|tr\)\d*\(\>\|[-_]\)" " Types

    hi textpath cterm=NONE ctermfg=113 ctermbg=234
    "hi textpath cterm=NONE ctermfg=None ctermbg=237
    syntax match textpath "\.\(sh\|h\|hpp\|hh\)\@!\a\{1,4\}\(\d\?\([ "';:/0-9]\||[0-9]\+|\|$\)\)\@="

    " header path
    hi headerpath cterm=NONE ctermfg=211 ctermbg=234
    syntax match headerpath "\.\(h\|hpp\|hh\)\>"

    "hi pathshell cterm=NONE ctermfg=202 ctermbg=234
    hi pathshell cterm=NONE ctermfg=202 ctermbg=088
    "hi pathshell cterm=NONE ctermfg=166 ctermbg=234
    "good
    "syntax match pathshell "$\?\([A-Za-z0-9\-._/\+]\|\\ \)\{4,}\(\.\(sh\|exp\)\(\w\)\@!\)" " $NOTES/syntax.vim
    " consider highlighting only the extension.
    syntax match pathshell "\.\(sh\|exp\)\([^ :;'")]\@!\|$\)"
    syntax match pathshell "\<ssh.\?\>"
    " autocmd BufEnter,WinEnter * call matchadd("Error", "\\<sudo\\>", -1)
    syntax match error "\<sudo\>"
    syntax match error "\<msudo\>"
    syntax match pathshell "\c\<auth[a-z]\+"

    hi pathh5 cterm=NONE ctermfg=131 ctermbg=234
    syntax match pathh5 "$\?\([A-Za-z0-9\-._/\+]\|\\ \)\{4,}\(\.\(h5\)\(.bz2\)\?\(\w\)\@!\)"

    " Put remaining custom highlighting in text.vim so it doesn't affect python
    " $BULK/s*/g*/c*/v*/vim/ftplugin/text.vim

    "thirdParty
    " Subdued text
    hi subdued cterm=NONE ctermfg=237 ctermbg=NONE

    hi brighter cterm=NONE ctermfg=240 ctermbg=248
    syntax match brighter "funcname:"

    " Very Subdued text
    hi verysubdued cterm=NONE ctermfg=234 ctermbg=NONE
    syntax match verysubdued "--- modulename:"

    hi textdone cterm=NONE ctermfg=085 ctermbg=022
    "hi textdone cterm=NONE ctermfg=028 ctermbg=022
    syntax match textdone "\c\(\w\+ \)\?\<\(DONE\|FIXED\)\>"
    syntax match textdone "\c\<\(finished\|completed\?\)\>"
    syntax match textdone "\c\<sol\(ution\|ved\)\>"
    syntax match textdone "\c\<done\.\@="

    syntax match serviceAdd "\c\<on\>\(-\| [^ ]\)\@!"
    syntax match serviceAdd "\c\<active\>"
    syntax match serviceRemove "\c\<off\>"

    hi started cterm=NONE ctermfg=226 ctermbg=020
    syntax match started "\c\<\(started\)\>"

    hi stopped cterm=NONE ctermfg=161 ctermbg=234
    syntax match stopped "\c\<\(stop\|pause\|suspend\)\>"
    syntax match stopped "\c\<\([a-z]\+ \)\?\(stopped\|paused\|suspended\)\>"

    hi saved cterm=NONE ctermfg=085 ctermbg=022
    syntax match saved "\c\(not \)\@<!\<Sav[a-z]\+\>"

    " complete is like when you no longer want to see it
    hi textcomplete cterm=NONE ctermfg=232 ctermbg=236
    syntax match textcomplete ".*\<COMPLETE\>.*"
    "syntax match textcomplete "\s\+\<COMPLETE\>\s\+"

    hi textwaiting cterm=NONE ctermfg=000 ctermbg=172
    syntax match textwaiting "\<\(WAITING\|PENDING\)\>"

    "hi textprogress cterm=NONE ctermfg=190 ctermbg=064
    hi textprogress cterm=NONE ctermfg=166 ctermbg=233
    syntax match textprogress "\c\(IN PROGRESS\>\)"
    " Put as .local.vimrc instead? Nah
    syntax match textprogress "\<INCOMPLETE\>"

    hi importantDate cterm=NONE ctermfg=154 ctermbg=235
    syntax match importantDate "\<\d\{4\}-\d\{2\}-\d\{2\}\>"

    syntax match gitbranch "[.-]\@!#\?\<\d\{3,5\}\>[.-]\@!" " ERROR
    syntax match gitbranch "#\(\d\+\>\)\@="

    " either positional parameter or money
    hi money cterm=NONE ctermfg=254 ctermbg=028
    syntax match money "\$\d\+\(\.\d\+\)\?\>" " $100

    hi textonloan cterm=NONE ctermfg=220 ctermbg=233
    syntax match textonloan ".*\<ON LOAN\>.*"

    hi textavailable cterm=NONE ctermfg=032 ctermbg=236
    syntax match textavailable ".*\<AVAILABLE\>.*"

    hi textunverified cterm=NONE ctermfg=144 ctermbg=233
    syntax match textunverified ".*\<UNVERIFIED\>.*"

    hi textnot cterm=NONE ctermfg=001 ctermbg=052
    syntax match textnot "\(\$\)\@!\(NOT\>\)\( IN PROGRESS\|\( [A-Z]\+\>\)\)\?"

    hi textdiscard cterm=NONE ctermfg=000 ctermbg=095
    syntax match textdiscard "\c\<\(FLAGS\?\|DISCARD\|ABO\?RT\|CANCEL\)\( THAT\)\?"
    syntax match textdiscard "\c\(STRIKEOUT\).*"
    syntax match textdiscard "\c\<cancel[a-z]*\>"

    hi texttimeboxed cterm=NONE ctermfg=000 ctermbg=095
    syntax match texttimeboxed "\c\(timeboxed\)"

    hi lowpriority cterm=NONE ctermfg=178 ctermbg=094
    syntax match lowpriority "\c\(LOW PRIORITY\)"
    syntax match lowpriority "\c\(LOW IMPORTANCE\)"
    syntax match lowpriority "\c\(not important\)" " this exists so that 'not important' does not get important highlighting

    syntax match criticalpriority "\c\(Insight:\)"

    "hi highprioritybg cterm=NONE ctermfg=NONE ctermbg=142
    "syntax match highprioritybg ".*\(REQUIRE\).*"

    hi priority cterm=NONE ctermfg=084 ctermbg=094
    syntax match priority "\c\<TODO\>"
    syntax match priority "\a\@<!\(Make\)\a\@!"
    syntax match priority "\<ONLY\>"
    syntax match priority "\c\<finish\>"
    syntax match priority "\c\<learn\>"
    syntax match priority "\c\<sidenote\>"

    hi task cterm=NONE ctermfg=171 ctermbg=235
    syntax match task "\(TASK\)"

    hi failing cterm=NONE ctermfg=001 ctermbg=052
    "syntax match failing "[^ ]* \?FAIL \?[^ ]*" " FAIL
    syntax match failing "ERROR"
    syntax match failing "\cis not\>"
    syntax match failing "\c\(is \)\?not \(permitted\|defined\)"
    syntax match failing "\cfail[a-z]*"
    syntax match failing "EXIT_FAILURE"
    syntax match failing "\cbroken"
    syntax match failing "\cconflict[a-z]*"
    syntax match failing "\cregression"
    syntax match failing "\cdisabled\?"
    "syntax match failing "\cfailures\?"
    syntax match failing "exited with return code [^0]\+"
    syntax match failing "\c\(\<FIX\>\)"
    syntax match failing "\c\(\<REPLACE\>\)"
    syntax match failing "\(\(^\|│\)\s\+\)\@<=In \([A-Za-z]\+ \)\+\(.*[,:]\(  \|$\|│\)\)\@="

    hi comment cterm=NONE ctermfg=110 ctermbg=240

    " comment
    hi glue cterm=NONE ctermfg=084 ctermbg=235
    "syntax match glue "\( // \)"
    syntax match comment '\(/\@<!///\?/\@!\)'
    syntax match comment '\(\(^\|│\) *\)\@<=///\+'

    syntax match comment '@\+'

    hi criticalpriority cterm=NONE ctermfg=196 ctermbg=226
    syntax match criticalpriority "\c\<CRITICAL\(LY\)\?\>"
    syntax match criticalpriority "\c\(vital\)"
    syntax match criticalpriority "\(NEXT STEP\)"
    syntax match criticalpriority "\c\<so important"
    syntax match criticalpriority "\cis king"
    syntax match criticalpriority "\cparamount"
    syntax match criticalpriority "\cessential"
    syntax match criticalpriority "Device or resource busy"
    syntax match criticalpriority "\<MUST\>"

    hi superimportant cterm=NONE ctermfg=226 ctermbg=208
    syntax match superimportant "\c\<super\(-duper\)\? important\>"
    syntax match superimportant "\c\<ultra important\>"
    syntax match superimportant "\c\<urgent\>"
    syntax match superimportant "\c\<absolutely\>"
    syntax match superimportant "Press\>"
    syntax match superimportant "\<W\(ait\|AIT\)\>"

    syntax match pathshell "\<root\>"

    hi toppriority cterm=NONE ctermfg=019 ctermbg=196
    syntax match toppriority "\c\(priority 1\)"
    syntax match toppriority "\c\(desperately\)"
    syntax match toppriority "\c\(top priority\)"
    syntax match toppriority "\c\(immediate\)\(ly\)\?"
    syntax match toppriority "\cextremely important"

    hi lookto cterm=NONE ctermfg=019 ctermbg=105
    syntax match lookto "\c\(\<look to[a-z]*\>\)"

    hi highpriority cterm=NONE ctermfg=226 ctermbg=142
    "syntax match highpriority "\c\d\a\a \(priority\)"
    syntax match highpriority "\(FOUND\)"
    "syntax match highpriority "\c\(high \)\?\(priority\)"
    syntax match highpriority "\c\(high priority\)"
    syntax match highpriority "\<must\>"
    syntax match highpriority "\c\<\(require\|needs\?\)\>"
    syntax match highpriority "\c\(most \|very \)\?\(importan\(t\|ce\|ly\)\)"
    syntax match highpriority "\a\@<!\(Need\)\a\@!"
    syntax match highpriority "\c\(THIS WAY\)"
    syntax match highpriority "\c\(on second thought\)"
    syntax match highpriority "\c\(instead\)"
    syntax match highpriority "\c\<note\>"
    syntax match highpriority "\c\<REMEMBER\>"
    syntax match highpriority "\c\(\<amazing\>\)"
    syntax match highpriority "\c\(\<interesting\>\)"
    syntax match highpriority "\c\(alternatively\)"
    syntax match highpriority "\c\(actually,\)"
    syntax match highpriority "\c\(be \)\?careful\a*"
    syntax match highpriority "\cdon'\?t forget"

    hi consider cterm=NONE ctermfg=199 ctermbg=026
    syntax match consider "\cthink about"
    syntax match consider "\cconsider\>"

    hi warning cterm=NONE ctermfg=214 ctermbg=094
    syntax match warning "\(DO NOT\>\)\( [A-Z]\+\)"
    syntax match warning "\c\<warning\>"
    syntax match warning "\c\<rethink\>"
    syntax match warning "\ctimeout"
    syntax match warning "\c\<already\>"
    
    hi warning2 cterm=NONE ctermfg=215 ctermbg=094
    syntax match warning2 "\c\<portability\>"

    hi unknownword cterm=NONE ctermfg=010 ctermbg=034
    syntax match unknownword "\(\<UNK\(KNOWN\)\?\>\)"
    syntax match unknownword "\s?\s"

    "hi textdate cterm=NONE ctermfg=007 ctermbg=237
    "syntax match textdate "[^│|]\+\(NZ[DS]T\|GMT\)$"

    " Can't do this because it makes python white
    "hi textheading cterm=NONE ctermfg=007 ctermbg=NONE
    "syntax match textheading "\(^\|│\)\(localhost\)\@!\(\w\|[.\-' /()+]\)\+:\(\s\+(.*)\)\?$" " heading/header

    " This sucks for y
    "hi yes cterm=NONE ctermfg=028 ctermbg=234
    "syntax match yes "\s\(Y\|+1\)\(\s\|,\|$\)"
    "syntax match yes "\s+1\(\s\|,\|$\)"

    " Do not take away the rainbow-ness of numbers. It's important for
    " identifying things like hashes using colour. Different shaeds of
    " grey will not cut it.

    " use colorful number highlights instead -- it's super useful!
    "hi gitcommit cterm=NONE ctermfg=111 ctermbg=025
    "syntax match gitcommit "\<[a-f0-9]\{7\}\>"
    "syntax match gitcommit "\<[a-f0-9]\{40\}\>"

    call NumberSyntax()
    
    " must come after three
    " 3DSensing
    hi sensing3d cterm=NONE ctermfg=219 ctermbg=240
    syntax match sensing3d '\c3dsensing'
    syntax match sensing3d '\csensing3d'

    "" this is actually good syntax highlighting more often than not.
    "" e.g. in 'top'
    "hi no cterm=NONE ctermfg=000 ctermbg=236
    "syntax match no "\s\(N\|0\)\(\s\|,\|$\)"

    " Put after options. This might be a bad idea
    " Yes, it's bad for man pages. Can I change it?
    " Keep it before options and make options not match diffRemove
    " stuff if possible.
    "hi diffRemove cterm=NONE ctermfg=196 ctermbg=235
    hi diffRemove cterm=NONE ctermfg=196 ctermbg=088
    " that last check is to stop it matching before diffadd
    syntax match diffRemove "\(\(^\|│\||\) *\)\@<=-\{1,3\}[>-]\@!"

    hi def link shOptionGeneral Special
    " you can have more than one single letter option chained
    " together. therefore, highlight them too.
    " one letter only
    syn match   shOptionGeneral "[ '"|(,[]\@<=[-+][_a-zA-Z#-][a-zA-Z-]\@!\([ .0-9'"=,[|)\]]\|$\)\@="
    syn match   shOptionGeneral "[ '"|(,[]\@<=\(, \?\)\@<![-+][-a-zA-Z][-_a-zA-Z]*[_a-zA-Z][a-zA-Z-]\@!\([ .0-9'"=,[|)\]]\|$\)\@="
    syn match   shOptionGeneral "[ '"|(,[]\@<=---\@![a-zA-Z#_][-_a-zA-Z#_]*\([ 0-9'"=,[|)\]]\|\)\@="
    "syn match   shOptionGeneral "[ '"|([]\@<=--\?[^-/ ,│\t$=`'"|);]*[^/ \-],│\t$=`'"|);][^\]/ ,\t=`'"|);]\+\([ '"=,|)\]]\|\)\@="
    " these must have at least one letter
    hi shOptionNum cterm=NONE ctermfg=204 ctermbg=237
    syn match   shOptionNum "[ '"|[]\@<=[-+]\([0-9]\+\>\)\@="
    
    "hi gcc ctermfg=209 ctermbg=023
    hi gcc ctermfg=051 ctermbg=032
    syntax match gcc "[ '"|,([]\@<=-isystem"
    syntax match gcc "[ '"|,([]\@<=-I\>"

    hi ld ctermfg=213 ctermbg=091
    "syntax match ld "\c\<ld\>"
    syntax match ld "\c\<ld\w*"
    syntax match ld "\/\@<=lib"
    syntax match ld "\<\(LD\|LIB\|LINK\)[A-Z_]\+"
    syntax match ld "[ '"|,([]\@<=-l[a-z]\@="
    syntax match ld "\c\<linker\>"

    hi ldbright ctermfg=210 ctermbg=126
    syntax match ldbright "[ '"|,([]\@<=-L[a-z]\@="

    "hi logcode ctermfg=253 ctermbg=023
    hi logcode ctermfg=023 ctermbg=166
    syntax match logcode "\c\<log\w*"

    " Not sure if I can use syntax file without affecting default syntax.

    "hi discrete cterm=NONE ctermbg=233 ctermfg=238
    hi discrete cterm=NONE ctermfg=238
    syntax match discrete "[<>]"
    " syntax match discrete "[<][a-z ]\@!"
    " syntax match discrete "[a-z ]\@<![>]"
    syntax match subdued ":"
    "syntax match numberpunctuation ":"

    hi emoticon cterm=NONE ctermfg=215 ctermbg=161
    syntax match emoticon " \@<=\(<3\|T_T\|>_>\|:)\|:(\|:'(\|¬_¬\|L/\|:/\|D:\|Ƹ̵̡Ӝ̵̨Ʒ\)\( \|$\)\@="
    syntax match emoticon "@}\~}\~\~\~"

    "hi unicode cterm=NONE ctermfg=000 ctermbg=236
    "hi unicode cterm=NONE ctermbg=NONE ctermfg=236
    "hi unicode cterm=NONE ctermbg=NONE ctermfg=17
    "hi unicode cterm=NONE ctermbg=NONE ctermfg=220
    " good purple
    "hi unicode cterm=NONE ctermfg=53 ctermbg=NONE
    " bright orange (bright is good because most unicode characters
    " have narrow edges)
    "hi unicode cterm=NONE ctermfg=214 ctermbg=NONE
    " bright red

    hi unicode cterm=NONE ctermfg=197 ctermbg=234
    syntax match unicode "[^\d0-\d127]\+"

    hi hlred cterm=NONE ctermfg=000 ctermbg=197
    hi hlgreen cterm=NONE ctermfg=000 ctermbg=28
    hi hlpurple cterm=NONE ctermfg=000 ctermbg=201
    " spreadsheet conditional formatting
    syntax match hlred "\<R: "
    syntax match hlgreen "\<G: "
    syntax match hlpurple "\<X: "


    " an also be a problog probabilistic fact (0-9) or a decision fact (?)
    syntax match discrete "[a-z0-9?>]\@<=::\<"
    " this breaks comments
    "syntax match discrete "\( \?/ \?\)"
    " this overrides a single unicode character for tmux's filler
    syntax match discrete "\%o267"

    " hi brightblue cterm=NONE ctermfg=236
    syntax match morediscrete "\>\.\( \|$\)\@="

    "hi brightoperator cterm=NONE ctermfg=244
    "hi brightoperator cterm=NONE ctermfg=088
    " hi brightoperator cterm=NONE ctermfg=196
    "hi brightoperator cterm=NONE ctermfg=042
    syntax match brightoperator "[ |]\@<! \(==\|[%]\) "
    "syntax match brightoperator "[ |]\@<! [!+=*/><-]=\? "
    syntax match brightoperator "[ |]\@<! [!=/-]=\? "
    "syntax match brightoperator "[ |]\@<! \*\*\? "
    "syntax match brightoperator "\([^ ] \? \)\@<=\(<<\|>>\)\(  \?[^ ]\)\@="
    syntax match brightoperator " [=-]>\( \|$\|│\)\@="
    syntax match brightoperator "<[=-] [ |]\@!"
    syntax match brightoperator "\c[a-z]\@<=->[a-z]\@="
    syntax match brightoperator "\c[a-z]\@<=<-[a-z]\@="
    syntax match brightoperator "\([^ ] \? \)\@<=-\(  \?[^ ]\)\@="
    syntax match brightoperator "[!,&]"
    syntax match gitbranch "\^"
    " Can't put + above because of diffs
    syntax match brightoperator "\(^\|│\)\@<!+"
    "syntax match brightoperator "\.\?\(#\**\)\@<!\*"
    hi asteriskoperator ctermbg=052 ctermfg=196
    syntax match asteriskoperator "\.\?\(#\**\)\@<!\*"
    syntax match brightoperator ":[=-]"
    syntax match brightoperator " \@<=++ \@="

    " Must come after the brightoperator +
    " highlight 2 in a row for "git show".
    "hi diffAdd cterm=NONE ctermfg=076 ctermbg=235
    hi diffAdd cterm=NONE ctermfg=076 ctermbg=028
    syntax match diffAdd "\(\(^\|│\||\) *\)\@<=+\{1,3\}"

    syntax match subdued "[0-9]\@<=%"

    hi gitbranch cterm=NONE ctermfg=161 ctermbg=052
    hi brightoperator2 cterm=NONE ctermbg=235 ctermfg=083
    syntax match brightoperator2 "[?]"
    " being the same color as comments, I was unable to differentiate inside of $VAS/projects/scripts/timestampify.pl
    syntax match gitbranch "[$]"
    syntax match brightoperator2 "\\\@<=|=\?"

    "hi brightoperator3 cterm=NONE ctermbg=018 ctermfg=020
    "hi brightoperator3 cterm=NONE ctermbg=235 ctermfg=246
    "hi brightoperator3 cterm=NONE ctermbg=021 ctermfg=117
    hi brightoperator3 cterm=NONE ctermbg=060 ctermfg=202
    syntax match brightoperator3 "\(\\\|| \|* \|[/_]\)\@<!|=\?"

    " for man pages -- maybe it's better to do post processing on the
    " man pages themselves or have man page-only syntax highlighting
    " in this case, rather than adding more to the thing.
    " LOW PRIORITY
    "syntax match morediscrete "[a-zA-Z]\@<=|\(-[a-zA-Z]\)\@="

    syntax match discrete ";"
    syntax match discrete " \@<=\\\+; \@="

    hi unaryoperator ctermbg=239 ctermfg=105
    syntax match unaryoperator "\(\\+ \?\)[a-z]\@="
    syntax match unaryoperator "+\@<!++[a-z]\@="
    syntax match unaryoperator "[a-z]\@<=+++\@!"

    hi compiler ctermbg=177 ctermfg=129
    syntax match compiler "distcc"
    syntax match compiler "\<[gc]++"

    hi new cterm=NONE ctermfg=210 ctermbg=025
    syntax match new "\c\<new\([- ][a-z0-9]\+\( camera\)\?\)\?\(/[a-z0-9]\+\)\?\>"

    hi magitstandout cterm=NONE ctermfg=193 ctermbg=244
    syntax match magitstandout "\(\(new file\|resolved\|unmerged\|modified\|deleted \)\@<=   \)[^ ]\+"

    hi old cterm=NONE ctermfg=178 ctermbg=090
    syntax match old "\c\<old\>"

    " this needs to come after the number highlighting to get priority
    " over it
    "hi tmuxsession cterm=NONE ctermfg=196 ctermbg=239
    "hi tmuxsession cterm=NONE ctermfg=091 ctermbg=199
    hi tmuxsession cterm=NONE ctermfg=199 ctermbg=053
    syntax match tmuxsession "\(^\|│\||\)F\d\+ \^\?[A-Za-z0-9-]\+\>"
    syntax match tmuxsession "\(\<localhost\(_[A-Za-z0-9-]\+\)*\)\@<=:"
    syntax match tmuxsession "\<localhost\(\(_[A-Za-z0-9-]\+\)*:\)\@="
    syntax match tmuxsession "\<localhost\(\(_[A-Za-z0-9-]\+\)\+\)\@="
    "localhost_ws_cpp

    """ " this should come after numbers
    """ syntax match crown '[CT]1515'
    """ syntax match crown 'H5'

    """ syntax match crown '\c\<gena\>'

    """ syntax match crown '\c\<brett\( robison\)\?\>'

    hi ui cterm=NONE ctermfg=242 ctermbg=239
    syntax match ui "[^[]\@<!|\+"

    " It's problematic. Will I miss it?
    hi textunderline cterm=NONE ctermfg=240 ctermbg=236
    ""syntax match textunderline "\(^\|│\| \{,2}\)[-	=]\{4,}\$\?$" " underline
    "syntax match textunderline "\([=# -]\)\@<![=#-]\{4,20}\([=# -]\)\@!" " underline
    "syntax match textunderline "\([+*x -]\)\@<![+*x]\{10,20}\([+*x -]\)\@!" " underline

    "" these are the good ones but it's not worth having them on
    "syntax match textunderline "[=#-]\{4,10}\([=# -│|]\|$\)\@!" " underline
    "syntax match textunderline "[+*x]\{10,}\([+*x -]\)\@!" " underline

    " this should override above for git changes in magit
    hi textunderlineadd cterm=NONE ctermfg=042 ctermbg=236
    syntax match textunderlineadd "\(| \+[0-9]\+ \)\@<=[+]\+\(  \|$\|│\)\@="

    " this should override above for git changes in magit
    hi textunderlinemod cterm=NONE ctermfg=202 ctermbg=236
    syntax match textunderlinemod "\(| \+[0-9]\+ \)\@<=[+]\+[-]\+\(  \|$\|│\)\@="

    " this should override above for git changes in magit
    hi textunderlinerem cterm=NONE ctermfg=124 ctermbg=236
    syntax match textunderlinerem "\(| \+[0-9]\+ \)\@<=[-]\+\(  \|$\|│\)\@="

    "hi ycombinator cterm=NONE ctermbg=239
    ""syntax match ycombinator "^ \{10,\}\d\+\.  "
    "syntax match ycombinator "^ \{10,\}\d\+\.  \[\d\+\][^(]*"

    hi importantfolder cterm=NONE ctermfg=087 ctermbg=243
    syntax match importantfolder "\/ws\/[a-z0-9-]\+"
    
    " this doesn't play well with htop
    "hi forceemphasis cterm=NONE ctermfg=227 ctermbg=238
    "syntax match forceemphasis '\c\*\*.\+\*\*'

    hi punctuation cterm=NONE ctermfg=007 ctermbg=NONE
    syntax match punctuation "\(\(^\|│\||\)[^a-zA-Z]*\)\@<=[◆∙]"
    syntax match punctuation "\([^a-zA-Z]\+\)\@<=[◆∙]\s\+"

    hi texturl cterm=NONE ctermfg=069 ctermbg=234
    syntax match texturl "https\?://" " http://www.google.com
    syntax match texturl "ssh://" " ssh://stash

    hi emacstmuxkey cterm=NONE ctermfg=099 ctermbg=234
    "syntax match emacstmuxkey "\<\([ACMS]-\)\+[^ ]\(\.\|\s\|$\|>\?>-\)\@="
    syntax match emacstmuxkey "\<\([ACMS]-\)\+[^ ]\(\.\|\s\|$\|>\)\@="
    syntax match emacstmuxkey "\c\<\([ACMS]-\)\+\([a-z]\+-\)*[a-z]\+\(-[0-9]\|>\|\.\|\s\|\|:$\|\"\|>\?>-\)\@="
    syntax match emacstmuxkey "\(^\|\s\@<=\)\^[A-Z_]\>"
    syntax match emacstmuxkey "\<\([ACMS]-\)\+[F\"]\@="
    syntax match emacstmuxkey "‘[^ ]\+’"

    syntax match emacstmuxkey "\c\<\(\(esc\(ape\)\?\|page\|ctrl\|alt\|shift\|meta\)\>-\?\)\+"
    syntax match emacstmuxkey "\c\<\(\(esc\(ape\)\?\|pg\|page\|ctrl\|alt\|shift\|meta\)-\)\+\(.\( \|$\)\@=\|[a-z]\+\)"

    syntax match emacstmuxkey "\c\([ACMS]-\)\?<[a-z]\+\(-[0-3]\)\?>"

    " ranger
    syntax match emacstmuxkey "\(^\|│\||\) [a-zA-Z] \{11\} \@!"

    "hi viminfo cterm=NONE ctermfg=255 ctermbg=099
    "syntax match viminfo "\[\@<=[a-z]\+\]\@="

    syntax match brighter "\<d\([r-][w-]\)\@="

    hi allperm cterm=NONE ctermfg=154 ctermbg=166
    syntax match allperm 'rwx'

    hi rw cterm=NONE ctermfg=154 ctermbg=133
    syntax match rw 'rw-'

    hi rx cterm=NONE ctermfg=154 ctermbg=068
    syntax match rx 'r-x'

    hi ro cterm=NONE ctermfg=252 ctermbg=241
    syntax match ro 'r--'

    hi rs cterm=NONE ctermfg=226 ctermbg=208
    syntax match rs 'rws'

    " levels
    hi level4 cterm=NONE ctermfg=227 ctermbg=236

    hi level3 cterm=NONE ctermfg=206 ctermbg=236
    syntax match level3 '>\@<=all<\@='

    hi level2 cterm=NONE ctermfg=149 ctermbg=236
    syntax match level2 '>\@<=trace<\@='

    hi level1 cterm=NONE ctermfg=033 ctermbg=236
    syntax match level1 '>\@<=debug<\@='

    hi level0 cterm=NONE ctermfg=127 ctermbg=236
    syntax match level0 '>\@<=none<\@='

    hi staging cterm=NONE ctermfg=242 ctermbg=237
    syntax match staging '\/\@<=staging\/\@='

    "hi irc cterm=NONE ctermfg=242 ctermbg=237
    hi irc cterm=NONE ctermfg=237 ctermbg=242
    "syntax match irc '\c\(\d\d:\d\d\)\@<= < \([a-z ]\+> \)\@='
    "syntax match irc '\c\(\d\d:\d\d < [a-z ]\+\)\@<=> '
    " uses non-greedy
    syntax match discrete '\c\(\d\d:\d\d ::: .\{-\}\(  \|$\|│\)\@=\)'
    syntax match discrete '\c\(\d\d:\d\d \[.\{-\}\(  \|$\|│\)\@=\)'
    "syntax match discrete '\c\(\d\d:\d\d\)\( \[\)\@='
    " path separator /
    syntax match discrete "\(\>\|[!: ]\|^\)\@<=/\(\<\|\$\|  \|$\)\@="
    syntax match discrete "[+*/<>-]\@<!="
    syntax match discrete ">\@<!>\?>-\+>\@!"
    syntax match morediscrete "[[\]]"

    "hi googleblue cterm=NONE ctermfg=069 ctermbg=235
    hi googleblue cterm=NONE ctermfg=069 ctermbg=255
    syntax match googleblue '\c\<g\(oogle\)\@='
    syntax match googleblue '\c\(\<goo\)\@<=g\(le\)\@='
    syntax match googleblue '\<g\([rl]\>\)\@='
    syntax match googleblue '\<f\(l\>\)\@='

    "hi googlered cterm=NONE ctermfg=197 ctermbg=235
    hi googlered cterm=NONE ctermfg=197 ctermbg=255
    syntax match googlered '\c\(\<g\)\@<=o\(ogle\)\@='
    syntax match googlered '\c\(\<googl\)\@<=e[ry]\?'
    syntax match googlered '\(\<g\)\@<=[rl]\>'
    syntax match googlered '\(\<f\)\@<=l\>'
    " youtube
    syntax match googlered '\<yt\>'
    syntax match googlered '\<so\>'
    syntax match googlered '\<gh\>'
    syntax match googlered '\<ga\>'
    syntax match googlered '\<gx\>'
    syntax match googlered '\<wk\>'
    syntax match googlered '\<gdc\>'
    syntax match googlered '\<googling\>'
    syntax match googlered '\<youtube\>'

    hi tensorflow cterm=NONE ctermfg=202 ctermbg=255
    syntax match tensorflow '\c\<tensorflow\>'
    syntax match tensorflow '\c\<tf\>'
    syntax match tensorflow '\c\<keras\>'

    "hi hackernewsorange cterm=NONE ctermfg=255 ctermbg=202
    hi hackernewsorange cterm=NONE ctermfg=000 ctermbg=202
    syntax match hackernewsorange '\<hn\>'
    syntax match hackernewsorange '\<yc\>'
    syntax match hackernewsorange '\<ycombinator\>'
    syntax match hackernewsorange '\<hacker\>'

    "hi googleyellow cterm=NONE ctermfg=178 ctermbg=235
    hi googleyellow cterm=NONE ctermfg=178 ctermbg=255
    syntax match googleyellow '\c\(\<go\)\@<=o\(gle\)\@='

    " s/\([0-9]\+\)\([^[0-9]*\)\([0-9]\+\)/\3\2\1/
    "hi googlegreen cterm=NONE ctermfg=28 ctermbg=235
    hi googlegreen cterm=NONE ctermfg=28 ctermbg=255
    "hi googlegreen cterm=NONE ctermfg=255 ctermbg=28
    syntax match googlegreen '\c\(\<goog\)\@<=l\(e\)\@='

    hi unixutil cterm=NONE ctermfg=049 ctermbg=024
    syntax match unixutil '\c\<pip\>'
    syntax match unixutil "\<arg[cv]\>"
    syntax match tests "['\"]\@<=git [a-z]\+\>"

    hi online cterm=NONE ctermfg=049 ctermbg=024
    syntax match online "[\d10003]"
    syntax match online "[\d9711]"

    " logic / decision making
    hi logic cterm=NONE ctermfg=210 ctermbg=236
    syntax match logic "\ctherefore"
    syntax match logic "\creally do"
    syntax match logic "\cexcept"

    " this doesn't really belong to logic
    syntax match logic "\c\<but\>"

    " not sure how i feel about highlighting things that are also
    " keywords in code.
    " i actually feel kinda good about it, so long as the background
    " colour remains dark grey because it still shows in code.
    syntax match logic "\c\<if\>"
    syntax match logic "\c\<else\>"
    syntax match logic "\c\<el\(se\)\?if\>"
    syntax match logic "\c\<then\(  \|$\)\@!\>"
    syntax match discrete "\c\<then\(  \|$\)\@=\>"
    syntax match logic "\c\<and\>"
    syntax match logic "\c\</\?or\>"
    syntax match logic "\c\<case\>"
    syntax match logic "\c\<while\>"

    "hi codekeywords cterm=NONE ctermfg=197 ctermbg=236
    hi codekeywords cterm=NONE ctermfg=068 ctermbg=236
    syntax match codekeywords "^[a-z-0-9-A-Z_-]\+\(:\)\@="
    syntax match codekeywords "\<def\>"
    syntax match codekeywords "\<class\>"
    syntax match codekeywords "\<try\>"
    syntax match codekeywords "\<throw\>"
    syntax match codekeywords "\<catch\>"
    syntax match codekeywords "\<foreach\>"
    syntax match codekeywords "\<except\>"
    syntax match codekeywords "\<finally\>"
    syntax match codekeywords "\<yield\>"
    syntax match codekeywords "\<import\>"
    syntax match codekeywords "\<virtual\>"
    syntax match codekeywords "\<namespace\>"
    syntax match codekeywords "\<void\>"
    syntax match codekeywords "\<with\>"
    syntax match codekeywords "\<pass\>"
    syntax match codekeywords "#\?\<include\>"
    syntax match codekeywords "\<explicit\>"
    syntax match codekeywords "\<protected\>"
    syntax match codekeywords "\<vector\>"
    syntax match codekeywords "#\?\<define\>"
    "syntax match codekeywords "\<switch\>"
    syntax match codekeywords "\c\<for\>"
    syntax match codekeywords "\<With\>"
    syntax match codekeywords "\<To\>"
    syntax match codekeywords "\<Next\>"
    syntax match codekeywords "\c\<Private\>"
    syntax match codekeywords "\c\<Public\>"

    syntax match codekeywords "\<\(struct\|type\)\>"
    syntax match codekeywords "\<typedef\>"

    " haskell
    syntax match codekeywords "\<where\>"

    " not actually anything to do with money but shouldn't appear
    " often in that context
    syntax match money "\cjust entered"

    syntax match money "\cbitcoin"
    syntax match money "\cblockchain"

    " solidity
    syntax match codekeywords "\<contract\>"

    hi algorithms cterm=NONE ctermfg=129 ctermbg=236
    syntax match algorithms "\<argmin\>"
    syntax match algorithms "\<argmax\>"
    
    "hi libs cterm=NONE ctermfg=129 ctermbg=236
    syntax match discrete "\<boost\>"
    syntax match discrete "\<std\>"

    hi awesome ctermfg=063 ctermbg=053
    syntax match awesome "\<problog"
    syntax match awesome "\<query"
    syntax match awesome "\<queries"
    syntax match awesome "\<examples\?"
    syntax match awesome "\c\<search\>"
    syntax match awesome "\c\<artificial intelligence\>"
    syntax match awesome "\c\<ai\>"

    hi facebook ctermfg=255 ctermbg=062
    syntax match facebook "\c\<facebook\>"
    syntax match facebook "\c\<fb\>"

    hi buildfiles ctermfg=227 ctermbg=058
    syntax match buildfiles "\csconscript"
    syntax match buildfiles "\c\<scons\>"

    hi interesting ctermfg=149 ctermbg=029
    syntax match interesting "\cmachine[- ]\?learning"
    syntax match interesting "\cdeep[- ]\?learning"
    syntax match interesting "\clearning"
    syntax match interesting "\csemantic"
    syntax match interesting "\cartificial[- ]\?intelligence"
    syntax match interesting "\c\<ai\>"
    syntax match interesting "\c\<\(neural\)\(.network\)\?\>"
    syntax match interesting "\c\<predict[a-z]\+"
    syntax match interesting "\c\<probab[a-z]\+"  " Use chinese later to override
    syntax match interesting "\c\<classif[a-z]\+"
    syntax match interesting "\c\<sentim[a-z]\+"
    syntax match interesting "\(a.\?p\|poste\)riori"
    syntax match interesting "\<Magnet\>"

    hi automatic ctermfg=253 ctermbg=124
    syntax match automatic "\c\<macro\>"
    syntax match automatic "\c\<automat\w\+\>"

    "hi machinelearning ctermfg=163 ctermbg=098
    "hi machinelearning ctermfg=098 ctermbg=234
    hi machinelearning ctermfg=034 ctermbg=234
    syntax match machinelearning "\ck-means"
    syntax match machinelearning "\ccluster"
    syntax match machinelearning "\cgaussian"

    "hi math ctermfg=148 ctermbg=094
    hi math ctermfg=172 ctermbg=228
    syntax match math "\c\<pi\>"
    syntax match math "\c\<\(linear.\|abstract.\)\?algebra\>"

    hi whiteonblack ctermfg=255 ctermbg=245
    "syntax match whiteonblack "\c\(\<[a-z]*\(map\|bind\) \)\@<=[a-z]\+"
    syntax match whiteonblack "\c\(\<[a-z]*\(map\) \)\@<=[a-z]\+"
    " hi blackonwhite ctermfg=000 ctermbg=255
    "syntax match allcaps "\c\<[a-z]\+\(\(map\|bind\)\>\)\@="
    syntax match allcaps "\c\<[a-z]\+\(\(map\)\>\)\@="

    "hi serviceAdd cterm=NONE ctermfg=028 ctermbg=077
    "hi serviceRemove cterm=NONE ctermfg=124 ctermbg=196
    hi serviceAdd cterm=NONE ctermfg=077 ctermbg=028
    hi serviceRemove cterm=NONE ctermfg=196 ctermbg=088
    " Overrides brightoperator
    " service --status-all | vim -
    syntax match serviceAdd "\[\@<= + \]\@="
    " service --status-all | vim -
    syntax match serviceRemove "\[\@<= - \]\@="

    " for emacs' easy customization
    syntax match serviceAdd "\[\@<=+\]\@="
    syntax match serviceAdd "\[\@<=-\]\@="
    syntax match serviceRemove "\[\@<= \]\@="
    syntax match discrete "|---"

    " overrides doublequote
    " match vim comments but not strings
    syntax match comment '\(\([~+-]\|^\|│\||\) *\)\@<="\([^"]*\("[^"]*"[^"]*\)*"[^"]*\(  \|$\|│\)\)\@!'
    syntax match comment ' \@<=\(#\|%\|!\) \@='
    syntax match comment '\(\([~+-]\|^\|│\||\) *\)\@<=\(#\|%\|!\)'
    syntax match comment '\(\([~+-]\|^\|│\||\) *\)\@<=;'
    "syntax match morediscrete '\(\([~+-]\|^\|│\||\) *\(#\|\"\|%\|!\)\)\@<=\(#\|\"\|%\|!\)\+'
    " Putting a ! here used to hide the bang in the shebang line
    " this is about hiding consecutive quotes. Need to keep ! separate
    syntax match morediscrete '\(\([~+-]\|^\|│\||\) *\(#\|\"\|%\)\)\@<=\(#\|\"\|%\)\+'
    syntax match morediscrete '\(\([~+-]\|^\|│\||\) *\(!\)\)\@<=\(!\)\+'
    syntax match morediscrete '\(\([~+-]\|^\|│\||\) *;\)\@<=;\+'
    "syntax match glue '[#"%]'

    " common special characters
    syntax match discrete '\\[tn]'

    " other things i want hidden
    syntax match discrete '\.snippets'
    " Environment variables
    syntax match discrete '\(\$\)\@<=[A-Z]\+[/$]\@='
    syntax match discrete '\<const\>'

    syntax match morediscrete '¬'

    syntax match morediscrete '<<global>>'

    syntax match onlyhex 'a-z'
    syntax match onlyhex 'A-Z'
    syntax match onlyhex '0-9'

    " c-style comments
    " i think it's better in more situations with the blackish
    "background
    "hi glue2 cterm=NONE ctermfg=235 ctermbg=029
    hi glue2 cterm=NONE ctermfg=029 ctermbg=234
    " comment /* */
    syntax match glue2 '\(/\*\+\|\*\+/\)'
    " hi ccomment cterm=NONE ctermfg=186 ctermbg=NONE
    " syntax match glue2 '\(/\*\+\|\*\+/\)'
    " syntax match ccomment '\(\(^\|│\)\s*/\*\+\)\)\@<=.*\(  \|$\|│\)\@='
    " syntax match ccomment '\(\(^\|│\).*\(\*\+/\(  \|$\|│\)\)\@='

    " comma after a n option in a man page
    syn match discrete "\([-+][_a-zA-Z#-]\)\@<=,"

    hi master ctermfg=136 ctermbg=234
    syntax match master "master[_-]\@="

    hi matrix ctermfg=245 ctermbg=234
    syntax match matrix "[_-]\@<=matrix"

    hi verify ctermfg=024 ctermbg=234
    syntax match verify "verify[_-]\@="

    hi auto ctermfg=125 ctermbg=234
    syntax match auto "auto\(test\)\@="

    hi soak ctermfg=130 ctermbg=234
    syntax match soak "soak\(test\)\@="

    hi bin ctermfg=226 ctermbg=095
    "syntax match bin "\(\/s\?bin\/\)\@<=[A-Za-z]\+"
    "syntax match bin "\/s\?bin\/[A-Za-z-_]\+[A-Za-z_/-]\@!"
    syntax match bin "\(\/s\?bin\/\)\@<=[A-Za-z-_]\+[A-Za-z_/-]\@!"

    syntax match brightoperator "=\@<!=\{1,2\}=\@!"
    " this must come after the = operator
    " this just matches every single letter followed by a 3+ letter
    " word. So don't let the = be optional and it'll be fine
    syntax match emacstmuxkey " \@<==[A-Za-z] \([A-Z][a-z]\([A-Za-z-]\+ \?\)\+\)\@="
    syntax match buildfiles "\.\/"
    syntax match glue "\(\.\)\@<!\.\.\.\([./]\)\@!"
    syntax match buildfiles "`"

    hi gitbranch cterm=NONE ctermfg=197 ctermbg=052
    "syntax match gitbranch "\(\(^\|│\)[a-f0-9]\{7\} \)\@<=master"
    " this lagged it nvim to hell
    "syntax match gitbranch "\(\(^\|│\)[a-f0-9]\{7\}\)\@<= .\{-} \(δ \)\?»"
    " this is better
    "syntax match gitbranch " »"
    syntax match subdued "master"
    " syntax match gitbranch "\(\(^\|│\)[a-f0-9]\{7\}\)\@<= \([^ δ]\+ \)\+\(\(δ \)\?»\)\@="
    " syntax match gitbranch "\([a-f0-9]\{7\}\)\@<= \([^ δ]\+ \)\+\(\(δ \)\?»\)\@="
    " syntax match gitbranch "\([a-f0-9]\{7\}\)\@<= .\+\(»\(  \|$\|│\)\)\@="
    syntax match gitbranch "\(\(\(^\|│\)\s*\)\([a-f0-9]\{7\}\)\)\@<= [a-z-]\+ "
    " Using non-greedy here stopped the syntax match from flowing to
    " the adjacent pane.
    " \{-}
    syntax match gitbranch "\(\(\(^\|│\)\s*\)\([a-f0-9]\{7\} [a-z-]\+\|not git\) \[\)\@<=.\{-}\(\]\)\@="
    " syntax match buildfiles "\(\(\(^\|│\)\s*\)\([a-f0-9]\{7\} [a-z-]\+\|not git\) \[\)\@<=.*\(\]\)\@="
    syntax match buildfiles "δ"
    " syntax match gitbranch "\([a-z-]\+\)\@<= »\@="

    hi tilde ctermfg=033 ctermbg=019
    syntax match tilde "\(\(^\||\|│\) *\)\@<!\~\(\/\([a-z]\+\/\)\?\)\?"
    syntax match tilde "\(\(^\||\|│\) *\)\@<=\~\/\([a-z]\+\/\)\?"
    syntax match tilde "\(::\)\@<=\~\([A-Za-z0-9]\+\)"

    syntax match gitbranch "\.\.\/"

    "hi semibrightoperator cterm=NONE ctermfg=240 ctermbg=234
    syntax match three "\<third"
    syntax match tests "\c\(third\)\@<=party"

    syntax match discrete "\.\.\.\/"

    hi gitbranchdetached cterm=NONE ctermfg=161 ctermbg=052
    syntax match gitbranchdetached "\(\(^\|│\)[a-f0-9]\{7\}\)\@<=  \([^ ]\+ \)\+\(δ \)\?»"

    " this is actually for gdb help
    syntax match gitbranch  "\(^\|│\)\@<=\(-\?[a-z]\+\)\+\( -- \)\@="
    syntax match subdued  "origin\/"

    syntax match gdb  "\<release\/"

    syntax match glue '\c\(\<\|[^a-z]\)\@<=tmux[a-z]\@!'

    syntax match gitbranch  "-\?\<SIG[A-Z]\+\([0-9]\?\>\)\@="

    syntax match gitbranch "\ckill\(all\)\? \?\(-[A-Z0-9]\)\@="

    syntax match codekeywords "\chdf5\?"
    syntax match discrete "\<auto\>"

    " things with underscores must come after the underscores
    syntax match success '\(\<[A-Z5_]\+\)\@<=_MODE\>'
    syntax match success '\<[A-Z5_]\+\(_MODE\>\)\@='
    "syntax match success '\<EXIT_\([A-Z_]\+>\)\@='
    syntax match success "EXIT_SUCCESS"

    syntax match subdued "[a-z]\@<= | \(-[a-z]\)\@="

    syntax match gitbranch "\(\(^\|│\) *\([~+] \)\?\)\@<=snippet "
    syntax match buildfiles "\(snippet \)\@<=[^ ]\+"
    syntax match gitbranch "\<diverged\>"
    syntax match textunderlinemod "\<modified\>"
    syntax match serviceRemove "\<deleted\>"
    syntax match serviceAdd "\<resolved\>"

    syntax match serviceAdd "\<Installed\>"

    syntax match one '_\@<=w\>'
    syntax match one 'fg\>'
    syntax match one '\<fg'
    syntax match one '\cforeground'
    syntax match five '_\@<=s\>'
    syntax match five 'bg\>'
    syntax match five '\<bg'
    syntax match five '\cbackground'

    syntax match one '\c\(_\|\<\)\@<=x\(_\|\>\)\@='
    syntax match two '\c\(_\|\<\)\@<=y\(_\|\>\)\@='
    syntax match three '\c\(_\|\<\)\@<=z\(_\|\>\)\@='

    syntax match onlyhex '\([^A-Za-z0-9]\)\@<=%[a-zA-Z][a-zA-Z]\@!'
    syntax match zero '\([^A-Za-z0-9]\|\>\)\@<=%[a-z]\>'
    syntax match one '\([^A-Za-z0-9]\|\>\)\@<=%s\>'
    syntax match two '\([^A-Za-z0-9]\|\>\)\@<=%d\>'
    "syntax match three '\([^A-Za-z0-9]\|\>\)\@<=%\(u[ld]\|[ld]u\)\>'
    syntax match three '\([^A-Za-z0-9]\|\>\)\@<=%\([ld]u\)\>'
    syntax match four '\([^A-Za-z0-9]\|\>\)\@<=%f\>'
    syntax match five '\([^A-Za-z0-9]\|\>\)\@<=%lld\>'
    syntax match six '\([^A-Za-z0-9]\|\>\)\@<=%llu\>'
    syntax match brightoperator '\([^A-Za-z0-9]\|\>\)\@<=%\.\?[0-9]\@='

    hi interface cterm=NONE ctermfg=228 ctermbg=148
    syntax match interface '\<enp[0-9]\@='

    syntax match discrete '\<self\.'
    syntax match discrete '\<this->'

    " must come after _ discrete
    syntax match testcase '\<test_\([A-Z0-9a-z_]\+\.py\)\@='
    syntax match testcase '\(\<test_\)\@<=[A-Za-z_]\+\(\.py\)\@='
    syntax match testcase '\(\<test_[0-9]\+[a-z]*\)\@<=_[A-Za-z_]\+\(\.py\)\@='
    
    syntax match subdued "\.\(pyc\|os\?\)\>"

    syntax match subdued "\cnothing to \w\+"
    
    " For netstat -pntl | less
    syntax match subdued "\(python2\)"
    "syntax match discrete "Out\(\[[0-9]\+\]\)\@="
    syntax match discrete "Out\(\[[0-9]\+\]\)="
    syntax match discrete "In\[\([0-9]\+\]:=\)\@="
    syntax match discrete "\(In\[[0-9]\+\)\@<=\]:="
    syntax match discrete "\<fi\>"
    syntax match discrete "\<esac\>"

    " would be nicer if none was just light grey on dark grey.
    syntax match tests "\c\<none\>"

    hi searchtermsgreen ctermfg=000 ctermbg=084

    hi searchtermspurple ctermfg=000 ctermbg=201

    hi regex ctermfg=074 ctermbg=237
    syntax match regex "\c\<pcre\>"
    syntax match regex "\c\<regex\>"
    syntax match regex "\c\<match\>"

    syntax match diffRemove "<\(  \|$\|│\)\@="
    syntax match diffAdd "\(^\|│\)\@<=>\(  \|$\|│\)\@="

    syntax match diffRemove "<\{7\} "
    syntax match textunderlinemod "=\@<!=\{7\}\( \|$\)"
    syntax match diffAdd ">\{7\} "

    "syntax match glue2 "trace"

    hi blue ctermfg=063 ctermbg=019
    syntax match blue "\<blue\>"

    " Enhancement
    " $MYGIT/cytopia/ffscreencast.git/CHANGELOG.md
    syntax match blue "\<Enh\>"

    hi haskellop ctermfg=130 ctermbg=250
    syntax match haskellop "\((| \)\@<=[^ ]\+\( [A-Za-z -/[\]]\+ |)\)\@="

    hi haskelldesc ctermfg=209 ctermbg=234
    syntax match haskelldesc "\((| [^ ]\+ \)\@<=[A-Za-z -/[\]]\+\( |)\)\@="

    syntax match buildfiles "On branch"

    syntax match buildfiles "\<mk[a-z]*\>"

    hi tests cterm=NONE ctermfg=247 ctermbg=234
    "hi tests cterm=NONE ctermfg=NONE ctermbg=053
    "syntax match tests "/\@<=tests"
    "syntax match tests "tests/\@="
    "syntax match tests "\ctests\?"
    ""the start bit is so it's not coloured in. It's more important to
    " see it as 'tests'
    "syntax match tests "\([0-9][A-Za-z]*\)\?\(T\|\<t\)ests\?\([A-Za-z]*\)\?"
    syntax match tests "\c\([a-z]*\)\?tests\?\([a-z]*\)\?"

    " I want this to override tests
    hi hlgdb cterm=NONE ctermfg=000 ctermbg=255
    syntax match hlgdb "[^/ ]\+\.[a-z]\+:[0-9]\+\(:.*\|  \|$\|│\)\@="

    " Doesn't work cos of nvim rainbow
    "syntax match gitRtcPackage " \@\<=\[&\?\]"

    " Make those leading dots in unit tests less noticable
    syntax match morediscrete "\(^\|│\)\@<=\.\+"

    " untracked files in git rtc status
    syntax match morediscrete "\(^\|│\)\@<=?? [^ ]\+"
    syntax match gitbranch "\(^\|│\)\@<= M "

    "syntax match tests "\c\(TS_\)\?assert[_a-z]*\((.*)\)\?"
    syntax match tests "\c\(TS_\)\?assert[_a-z]*"

    " Use this syntax to tell me that something important died, as in
    " it broke the HIL test.
    hi reallyBad cterm=NONE ctermfg=226 ctermbg=197
    syntax match reallyBad "\cfatal"
    syntax match reallyBad "\cterminated"
    syntax match reallyBad "\cerror:"
    syntax match reallyBad "\c\<shame\>"

    " duplicate words
    hi reallyBad cterm=NONE ctermfg=226 ctermbg=197
    " Can't use this because it crosses newlines
    " syntax match reallyBad "\(\<[a-zA-Z]\+\>\)\_s\+\<\1\>"
    syntax match reallyBad "\(\<[a-zA-Z]\+\>\)\s\<\1\>"

    syntax match numberpunctuation "[0-9]\@<=[ :-][0-9]\@="

    hi boldquote cterm=NONE ctermfg=234 ctermbg=39
    " there can be 1 or 2 - in ediff
    syntax match boldquote "-\@<!-\?->>"
    syntax match boldquote "<<--\?-\@!"
    
    " haskell
    syntax match brightoperator "<[/.$*]>"
    syntax match brightoperator ">\{1,2\}="
    syntax match brightoperator "<>"
    syntax match brightoperator "=<<"

    syntax match failing "&\@<=optional "

    syntax match reallyBad "\cbanned"
    syntax match reallyBad "\ckicked"

    syntax match buildfiles "\c\<pip\>"
    syntax match buildfiles "\c\<pypi\>"
    syntax match buildfiles "\c\<apt\(-cache\)\?\>"
    syntax match buildfiles "\c\<npm\>"
    syntax match buildfiles "\c\<cabal\>"
    syntax match buildfiles "\c\<ghc-pkg\>"

    " imm-install
    syntax match gitRtcPackage "=== \d\+\/\d\+\( \w\+\)\+"

    " emacs keywords
    syntax match kashyap "(\@<=\([a-z-]\+\)\( \|$\)\@="
    syntax match justin "(\@<=:\([a-z-]\+\)\( \|$\)\@="
    syntax match toby "(\@<=\(unless\|def[a-z]\+\|add-to-list\|if\|let\|and\|not\|set\|setq\|or\|when\)\( \|$\)\@="

    " magit
    syntax match diffRemove "|\@<=---\@!"

    syntax match morediscrete "\<Domain Users\>"

    " latex
    syntax match morediscrete "\([a-zA-Z0-9]\)\@<!\(\\[a-z_]\+\)\+\>"

    syntax match discrete "\<pick\( [a-f0-9]\{7\}\)\@=\>"
    syntax match reallyBad "\<work\( [a-f0-9]\{7\}\)\@=\>"
    syntax match discrete "\<onto\( [a-f0-9]\{7\}\)\@=\>"

    " closing paren
    hi closesyntax cterm=NONE ctermfg=065 ctermbg=000
    " or use discrete?
    "syntax match closesyntax "\<end[a-f]\+\>"
    syntax match closesyntax "\<end\(ing\)\@![a-z]\+\>"
    syntax match closesyntax "End [A-Z][a-z]\+"

    " api
    hi api cterm=NONE ctermfg=112 ctermbg=238
    syntax match api "\c\<\(rest\|graphql\|api\)\>"

    " vimmap
    syntax match emacstmuxkey "\(\<MapM \w\+\)\@<=\( \w\)\+"

    hi devnull cterm=NONE ctermfg=124 ctermbg=000
    syntax match devnull "\/dev\/null"

    syntax match toby "\c\<github\>"

    "syntax match discrete '_t\>'
    "hi type cterm=NONE ctermfg=244 ctermbg=236
    syntax match codekeywords "[a-z0-9]\@<=_t\>"

    hi elonmusk cterm=NONE ctermfg=015 ctermbg=199
    " syntax match elonmusk "\ctesla"
    syntax match elonmusk "{{"
    syntax match elonmusk "}}"

    hi pullrequest cterm=NONE ctermfg=255 ctermbg=080
    syntax match pullrequest "\cpull request"

    " moustache / CLQL template
    syntax match emacstmuxkey "\({{\)\@<=[ a-zA-Z_0-9()-]*\(}}\)\@="

    hi ircroom cterm=NONE ctermfg=023 ctermbg=NONE
    syntax match ircroom "#\@<!##\?[A-Za-z-]\+"

    " codelingo CLQL
    syntax match toby "\(\(known\)\@<! as \)\@<=[^ ]\+$"

    " alsamixer must be super low priority
    " syntax match emacstmuxkey "\c< \+[/a-z ] \+>"
    " I changed this so irc names are highlighted. not sure if this is good

    hi ircname cterm=NONE ctermfg=093 ctermbg=234 " this looks the same as irc names, and is the superset, so i disabled the syntax just above
    syntax match ircname "\c< *[+@]\?[/a-z 0-9_-]\+\(\[m\]\)\?`\? *>"
    syntax match ircname "\(known as \)\@<=[^ ]\+$"

    " slack-term
    syntax match ircname "\c\(] \)\@<=<[/a-z 0-9._-]\+> \@="

    hi liesel cterm=NONE ctermfg=178 ctermbg=094
    syntax match liesel "\c\<lisel\>"
    
    " so $HOME/notes2018/chinese.vim
endf

command! GeneralSyntax silent! call GeneralSyntax()

"autocmd Syntax * call GeneralSyntax()
"autocmd VimEnter,BufWinEnter,BufEnter * call GeneralSyntax()
"    hi googleyellow cterm=NONE ctermfg=178 ctermbg=235
"autocmd VimEnter,BufWinEnter,BufEnter * call TextSyntax()

