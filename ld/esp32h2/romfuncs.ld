/* ROM function interface esp32h2.rom.ld for esp32h2
 *
 *
 * Generated from ./interface-esp32h2.yml md5sum c0ad4e113e5b29bb9d799f10f03edbc1
 *
 * Compatible with ROM where ECO version equal or greater to 0.
 */

/***************************************
 Group libgcc
 ***************************************/

/* Functions */
__absvdi2 = 0x40000850;
__absvsi2 = 0x40000854;
__adddf3 = 0x40000858;
__addsf3 = 0x4000085c;
__addvdi3 = 0x40000860;
__addvsi3 = 0x40000864;
__ashldi3 = 0x40000868;
__ashrdi3 = 0x4000086c;
__bswapdi2 = 0x40000870;
__bswapsi2 = 0x40000874;
__clear_cache = 0x40000878;
__clrsbdi2 = 0x4000087c;
__clrsbsi2 = 0x40000880;
__clzdi2 = 0x40000884;
__clzsi2 = 0x40000888;
__cmpdi2 = 0x4000088c;
__ctzdi2 = 0x40000890;
__ctzsi2 = 0x40000894;
__divdc3 = 0x40000898;
__divdf3 = 0x4000089c;
__divdi3 = 0x400008a0;
__divsc3 = 0x400008a4;
__divsf3 = 0x400008a8;
__divsi3 = 0x400008ac;
__eqdf2 = 0x400008b0;
__eqsf2 = 0x400008b4;
__extendsfdf2 = 0x400008b8;
__ffsdi2 = 0x400008bc;
__ffssi2 = 0x400008c0;
__fixdfdi = 0x400008c4;
__fixdfsi = 0x400008c8;
__fixsfdi = 0x400008cc;
__fixsfsi = 0x400008d0;
__fixunsdfsi = 0x400008d4;
__fixunssfdi = 0x400008d8;
__fixunssfsi = 0x400008dc;
__floatdidf = 0x400008e0;
__floatdisf = 0x400008e4;
__floatsidf = 0x400008e8;
__floatsisf = 0x400008ec;
__floatundidf = 0x400008f0;
__floatundisf = 0x400008f4;
__floatunsidf = 0x400008f8;
__floatunsisf = 0x400008fc;
__gcc_bcmp = 0x40000900;
__gedf2 = 0x40000904;
__gesf2 = 0x40000908;
__gtdf2 = 0x4000090c;
__gtsf2 = 0x40000910;
__ledf2 = 0x40000914;
__lesf2 = 0x40000918;
__lshrdi3 = 0x4000091c;
__ltdf2 = 0x40000920;
__ltsf2 = 0x40000924;
__moddi3 = 0x40000928;
__modsi3 = 0x4000092c;
__muldc3 = 0x40000930;
__muldf3 = 0x40000934;
__muldi3 = 0x40000938;
__mulsc3 = 0x4000093c;
__mulsf3 = 0x40000940;
__mulsi3 = 0x40000944;
__mulvdi3 = 0x40000948;
__mulvsi3 = 0x4000094c;
__nedf2 = 0x40000950;
__negdf2 = 0x40000954;
__negdi2 = 0x40000958;
__negsf2 = 0x4000095c;
__negvdi2 = 0x40000960;
__negvsi2 = 0x40000964;
__nesf2 = 0x40000968;
__paritysi2 = 0x4000096c;
__popcountdi2 = 0x40000970;
__popcountsi2 = 0x40000974;
__powidf2 = 0x40000978;
__powisf2 = 0x4000097c;
__subdf3 = 0x40000980;
__subsf3 = 0x40000984;
__subvdi3 = 0x40000988;
__subvsi3 = 0x4000098c;
__truncdfsf2 = 0x40000990;
__ucmpdi2 = 0x40000994;
__udivdi3 = 0x40000998;
__udivmoddi4 = 0x4000099c;
__udivsi3 = 0x400009a0;
__udiv_w_sdiv = 0x400009a4;
__umoddi3 = 0x400009a8;
__umodsi3 = 0x400009ac;
__unorddf2 = 0x400009b0;
__unordsf2 = 0x400009b4;
__extenddftf2 = 0x400009b8;
__trunctfdf2 = 0x400009bc;


/***************************************
 Group newlib
 ***************************************/

/* Functions */
esp_rom_newlib_init_common_mutexes = 0x4000049c;
memset = 0x400004a0;
memcpy = 0x400004a4;
memmove = 0x400004a8;
memcmp = 0x400004ac;
strcpy = 0x400004b0;
strncpy = 0x400004b4;
strcmp = 0x400004b8;
strncmp = 0x400004bc;
strlen = 0x400004c0;
strstr = 0x400004c4;
bzero = 0x400004c8;
_isatty_r = 0x400004cc;
sbrk = 0x400004d0;
isalnum = 0x400004d4;
isalpha = 0x400004d8;
isascii = 0x400004dc;
isblank = 0x400004e0;
iscntrl = 0x400004e4;
isdigit = 0x400004e8;
islower = 0x400004ec;
isgraph = 0x400004f0;
isprint = 0x400004f4;
ispunct = 0x400004f8;
isspace = 0x400004fc;
isupper = 0x40000500;
toupper = 0x40000504;
tolower = 0x40000508;
toascii = 0x4000050c;
memccpy = 0x40000510;
memchr = 0x40000514;
memrchr = 0x40000518;
strcasecmp = 0x4000051c;
strcasestr = 0x40000520;
strcat = 0x40000524;
strdup = 0x40000528;
strchr = 0x4000052c;
strcspn = 0x40000530;
strcoll = 0x40000534;
strlcat = 0x40000538;
strlcpy = 0x4000053c;
strlwr = 0x40000540;
strncasecmp = 0x40000544;
strncat = 0x40000548;
strndup = 0x4000054c;
strnlen = 0x40000550;
strrchr = 0x40000554;
strsep = 0x40000558;
strspn = 0x4000055c;
strtok_r = 0x40000560;
strupr = 0x40000564;
longjmp = 0x40000568;
setjmp = 0x4000056c;
abs = 0x40000570;
div = 0x40000574;
labs = 0x40000578;
ldiv = 0x4000057c;
qsort = 0x40000580;
rand_r = 0x40000584;
rand = 0x40000588;
srand = 0x4000058c;
utoa = 0x40000590;
itoa = 0x40000594;
atoi = 0x40000598;
atol = 0x4000059c;
strtol = 0x400005a0;
strtoul = 0x400005a4;

uart_tx_one_char = 0x40000058;
