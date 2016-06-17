/* ---------------------------------------------------------------------------
 (c) Telefónica I+D, 2013
 Author: Paulo Villegas

 This script is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 -------------------------------------------------------------------------- */

// var linkages = {\"nodes\":[{\"index\":\"SP132328\",\"links\":[\"HT341\",\"HT153\",\"SP129818\",\"SP260476\",\"HT464\"],\"plan_number_date\":\"SP132328 (2000-06-27)\",\"surveyor\":\"CRAIG WILLIAM EDMONSTON\",\"description\":\"LOTS 32-37 (LOT 32 BEING PART OF LOT 1 ON CP825707) CANCELLING LOT 32 ON HT341\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT341\",\"links\":[\"SP132328\",\"HT153\",\"SP129818\",\"SP260476\",\"HT464\"],\"plan_number_date\":\"HT341 (1974-05-08)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.32\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT153\",\"links\":[\"HT341\",\"SP132328\",\"SP129818\",\"SP260476\",\"HT464\"],\"plan_number_date\":\"HT153 (1957-08-11)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.32\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT340\",\"links\":[],\"plan_number_date\":\"HT340 (1974-03-14)\",\"surveyor\":\"JOHN RODERICK SAWTELL HARRIGAN\",\"description\":\"RD IN POR.4V & 32\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"L42154\",\"links\":[],\"plan_number_date\":\"L42154 (1888-12-03)\",\"surveyor\":\"WILLIAM COOKE CLEMENTS\",\"description\":\"RAILWAY RESERVE NOW POR.27,29 & 32\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"RP608339\",\"links\":[\"D4121\",\"RP909781\",\"RP604486\",\"D4127\",\"D4126\",\"RP616510\",\"D41213\",\"D41212\",\"SP104777\",\"CP884700\",\"RP604749\",\"RP607254\",\"D4125\"],\"plan_number_date\":\"RP608339 (1963-11-28)\",\"surveyor\":\"BRIAN GEOFFREY MOORE\",\"description\":\"LOTS 1 - 5 CANCELLING LOTS 201 & 210 ON D4121\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"D4121\",\"links\":[\"RP909781\",\"RP608339\",\"RP604486\",\"D4127\",\"D4126\",\"RP616510\",\"D41213\",\"D41212\",\"SP104777\",\"CP884700\",\"RP604749\",\"RP607254\",\"D4125\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\"],\"plan_number_date\":\"D4121 (1889-02-23)\",\"surveyor\":\"WILLIAM COOKE CLEMENTS\",\"description\":\"ALLOT 1-10 EACH OF SEC.1-8; SEC.11-13\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"IS60450\",\"links\":[],\"plan_number_date\":\"IS60450 (1960-08-20)\",\"surveyor\":\"FRANCIS ALFRED BURFEIN\",\"description\":\"LOTS 1-4 ON RP608339\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT480\",\"links\":[\"HT659\",\"HT665\"],\"plan_number_date\":\"HT480 (1980-03-14)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.43-45 & 46\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"SP217269\",\"links\":[\"RP612007\",\"H4016\"],\"plan_number_date\":\"SP217269 (2008-05-29)\",\"surveyor\":\"RICHARD JON KNOX FORD\",\"description\":\"PLAN OF LOTS 20-25 CANCELLING LOT 2 ON RP612007\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"RP612007\",\"links\":[\"H4016\",\"SP217269\"],\"plan_number_date\":\"RP612007 (1974-09-09)\",\"surveyor\":\"BRIAN GEOFFREY MOORE\",\"description\":\"LOTS 1 & 2 CANCELLING LOT 9021 ON H4016\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"H4016\",\"links\":[\"RP612007\",\"SP217269\"],\"plan_number_date\":\"H4016 (1893-09-09)\",\"surveyor\":\"ERNEST ROBINS WARREN\",\"description\":\"POR.21V\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"RP604486\",\"links\":[\"D4121\",\"RP909781\",\"RP608339\",\"D4127\",\"D4126\",\"RP616510\",\"D41213\",\"D41212\",\"SP104777\",\"CP884700\",\"RP604749\",\"RP607254\",\"D4125\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\"],\"plan_number_date\":\"RP604486 (1932-09-20)\",\"surveyor\":\"NOT LICENSED AT DATE OF SURVEY\",\"description\":\"LOTS 1 & 2 CANCELLING LOT 205 ON D4121\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"H4013\",\"links\":[],\"plan_number_date\":\"H4013 (1893-05-12)\",\"surveyor\":\"ERNEST ROBINS WARREN\",\"description\":\"POR.19V\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"SP260476\",\"links\":[\"SP129818\",\"HT464\"],\"plan_number_date\":\"SP260476 (2013-07-08)\",\"surveyor\":\"RPS AUSTRALIA EAST PTY LTD\",\"description\":\"LOT 601 CANCELLING LOT 601 ON SP129818 (&PART OF USL BEING CLOSED ROAD)\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"SP129818\",\"links\":[\"SP260476\",\"HT464\"],\"plan_number_date\":\"SP129818 (2000-08-28)\",\"surveyor\":\"DTS GROUP QLD PTY LTD\",\"description\":\"LOT 601 (BEING PART OF LOT 1 ON CP825707) CANCELLING LOTS 601,602,604,613 & 614 ON P42537,LOT 40 ON HT464,LOT 32 ON SP132328 AND LOTS 1 & 2 ON HT323\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT323\",\"links\":[\"SP129818\",\"SP260476\",\"HT464\"],\"plan_number_date\":\"HT323 (1973-03-27)\",\"surveyor\":\"WILLIAM JOHN CHARLES BURVILL\",\"description\":\"  RAILWAY RESUMPTION IN ROAD\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT464\",\"links\":[\"SP129818\",\"SP260476\"],\"plan_number_date\":\"HT464 (1978-08-29)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.40\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"P42537\",\"links\":[\"SP129818\",\"SP129817\",\"SP260476\",\"HT464\",\"SP170607\",\"SP170608\",\"HT326\",\"HT82\"],\"plan_number_date\":\"P42537 (1962-08-30)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"LOTS 21-26,31,32,41,51-53,61,71-73,81,91-94,101-102,111,121,131,141,161,171-173,175,181-186,191,201-203,221,231,241,271,291,301,311-313,321,331,341,351-352,361,381,391-392,411,421,481,811,821, CANCELLING     RAILWAY\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"D4128\",\"links\":[],\"plan_number_date\":\"D4128 (1971-09-29)\",\"surveyor\":\"GARNET BRUCE LINCOLN\",\"description\":\"ALLOTS 1-22 OF SEC.13\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT489\",\"links\":[\"HT149\",\"HT84\",\"HT87\"],\"plan_number_date\":\"HT489 (1980-06-11)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.27 & 29\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT149\",\"links\":[\"HT489\",\"HT87\",\"HT84\"],\"plan_number_date\":\"HT149 (1956-12-04)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.27 & 29\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT87\",\"links\":[\"HT149\",\"HT489\",\"HT84\"],\"plan_number_date\":\"HT87 (1923-06-26)\",\"surveyor\":\"WILLIAM HENRY FLOWERS\",\"description\":\"POR.28 & 29\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT84\",\"links\":[\"HT149\",\"HT489\",\"HT87\"],\"plan_number_date\":\"HT84 (1922-12-06)\",\"surveyor\":\"WILLIAM HENRY FLOWERS\",\"description\":\"POR.27\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT101\",\"links\":[],\"plan_number_date\":\"HT101 (1937-09-07)\",\"surveyor\":\"ALLAN WILLIAM MANNING\",\"description\":\"RD IN POR.27\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT148\",\"links\":[],\"plan_number_date\":\"HT148 (1955-07-28)\",\"surveyor\":\"RAY LAMONT\",\"description\":\"RD IN POR.27\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"DP234715\",\"links\":[],\"plan_number_date\":\"DP234715 (2010-07-23)\",\"surveyor\":\"CHARLES LOUIS FINCH\",\"description\":\"PLAN OF LEASE A IN LOT 29 ON HT489 \",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"DP256822\",\"links\":[],\"plan_number_date\":\"DP256822 (2012-10-30)\",\"surveyor\":\"CHARLES LOUIS FINCH\",\"description\":\"LEASE B IN LOT 29 ON HT489\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"D4127\",\"links\":[\"D4121\",\"RP909781\",\"RP608339\",\"RP604486\",\"D4126\",\"RP616510\",\"D41213\",\"D41212\",\"SP104777\",\"CP884700\",\"RP604749\",\"RP607254\",\"D4125\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\"],\"plan_number_date\":\"D4127 (1970-06-09)\",\"surveyor\":\"RICHARD ROBERT SPURDLE\",\"description\":\"ALLOTS 5&11 OF SEC.6\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT334\",\"links\":[\"HT126\"],\"plan_number_date\":\"HT334 (1973-12-14)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.35 & 38\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT481\",\"links\":[],\"plan_number_date\":\"HT481 (1979-08-10)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.41\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"D4129\",\"links\":[],\"plan_number_date\":\"D4129 (1971-11-17)\",\"surveyor\":\"JACOBUS DE LANGE\",\"description\":\"ALLOTS 1&2 OF SEC.12\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"D41213\",\"links\":[\"D4121\",\"RP909781\",\"RP608339\",\"RP604486\",\"D4127\",\"D4126\",\"RP616510\",\"D41212\",\"SP104777\",\"CP884700\",\"RP604749\",\"RP607254\",\"D4125\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\"],\"plan_number_date\":\"D41213 (1982-02-24)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"ALLOT 12 OF SEC.6\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT107\",\"links\":[],\"plan_number_date\":\"HT107 (1941-06-13)\",\"surveyor\":\"ARTHUR JOHN EDMISTON\",\"description\":\"RD IN POR.1;RD IN POR.1V & 28 PARISH CHARLEVUE\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"H4017\",\"links\":[\"RP606236\"],\"plan_number_date\":\"H4017 (1893-09-09)\",\"surveyor\":\"ERNEST ROBINS WARREN\",\"description\":\"POR.20V,22V,23V & 24V\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"L42110\",\"links\":[],\"plan_number_date\":\"L42110 (1884-07-21)\",\"surveyor\":\"ERNEST MORETON WARAKER\",\"description\":\"TRAVERSE OF BRIDGEWATER & SPRINGTON CREEKS IN POR.16, 22, 23 & R.2;AND POR.1V, 5V-10V, 22V-24V, 13-15 & 18; PARISH CHARLEVUE;AND IN POR.12V & 13V, 16 & 17; PARISH ABINGER;\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"D4125\",\"links\":[\"D4121\",\"RP909781\",\"RP608339\",\"RP604486\",\"D4127\",\"D4126\",\"RP616510\",\"D41213\",\"D41212\",\"SP104777\",\"CP884700\",\"RP604749\",\"RP607254\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\"],\"plan_number_date\":\"D4125 (1960-01-28)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"ALLOT 2 OF SEC.4\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"DP218366\",\"links\":[],\"plan_number_date\":\"DP218366 (2011-12-05)\",\"surveyor\":\"ALEXANDER ROBERT DAWSON\",\"description\":\"PLAN OF LOTS 1-6 CANCELLING LOT 2 ON D4125\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"IS60350\",\"links\":[],\"plan_number_date\":\"IS60350 (1959-10-23)\",\"surveyor\":\"FRANCIS ALFRED BURFEIN\",\"description\":\"LOTS 402-410 ON D4121 AND LOTS 501-510 ON D4121\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"H406\",\"links\":[],\"plan_number_date\":\"H406 (1889-03-22)\",\"surveyor\":\"WILLIAM COOKE CLEMENTS\",\"description\":\"POR.1V\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"SP254059\",\"links\":[\"RP617039\",\"RP616175\",\"HT342\",\"H403\",\"SP152759\",\"RP618487\",\"RP807445\"],\"plan_number_date\":\"SP254059 (2012-07-27)\",\"surveyor\":\"CAPRICORN SURVEY GROUP (CQ) PTY LTD\",\"description\":\"PLAN OF LOTS 1 & 2 CANCELLING LOTS 1 & 3 ON RP617039 AND LOT 4 ON SP152759\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"SP152759\",\"links\":[\"RP807445\",\"RP618487\",\"RP616175\",\"HT342\",\"H403\",\"SP254059\",\"RP617039\"],\"plan_number_date\":\"SP152759 (2002-09-10)\",\"surveyor\":\"ANTHONY JOSEPH HOFFMANN\",\"description\":\"LOTS 4 & 6 CANCELLING LOT 2 ON RP618487 & LOT 6 ON RP807445\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"RP618487\",\"links\":[\"RP807445\",\"RP616175\",\"HT342\",\"H403\",\"SP152759\",\"RP617039\",\"SP254059\"],\"plan_number_date\":\"RP618487 (1985-11-15)\",\"surveyor\":\"CHARLES RODNEY SCHLENCKER\",\"description\":\"LOTS 2 & 4 CANCELLING LOT 2 ON RP616175\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"RP807445\",\"links\":[\"SP152759\",\"RP618487\",\"RP616175\",\"HT342\",\"H403\",\"SP254059\",\"RP617039\"],\"plan_number_date\":\"RP807445 (1990-12-14)\",\"surveyor\":\"MCNEE SURVEYS PTY LTD\",\"description\":\"LOTS 5 AND 6 CANCELLING LOT 4 ON RP618487\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"RP616175\",\"links\":[\"RP617039\",\"HT342\",\"H403\",\"RP618487\",\"SP254059\",\"RP807445\",\"SP152759\"],\"plan_number_date\":\"RP616175 (1983-01-11)\",\"surveyor\":\"CHARLES RODNEY SCHLENCKER\",\"description\":\"LOTS 1-2 CANCELLING LOT 9004 ON HT342\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT342\",\"links\":[\"RP616175\",\"H403\",\"RP617039\",\"RP618487\",\"SP254059\",\"RP807445\",\"SP152759\"],\"plan_number_date\":\"HT342 (1974-05-08)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.4V\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"H403\",\"links\":[\"HT342\",\"RP616175\",\"RP617039\",\"RP618487\",\"SP254059\",\"RP807445\",\"SP152759\"],\"plan_number_date\":\"H403 (1888-12-03)\",\"surveyor\":\"WILLIAM COOKE CLEMENTS\",\"description\":\"POR.4V,5V,7V & 8V\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT109\",\"links\":[\"HT342\",\"RP616175\",\"H403\",\"RP617039\",\"RP618487\",\"SP254059\",\"RP807445\",\"SP152759\"],\"plan_number_date\":\"HT109 (1941-06-20)\",\"surveyor\":\"ARTHUR JOHN EDMISTON\",\"description\":\"POR.31;RD IN POR.4V & 7V\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"RP607254\",\"links\":[\"D4121\",\"RP909781\",\"RP608339\",\"RP604486\",\"D4127\",\"D4126\",\"RP616510\",\"D41213\",\"D41212\",\"SP104777\",\"CP884700\",\"RP604749\",\"D4125\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\"],\"plan_number_date\":\"RP607254 (1953-08-08)\",\"surveyor\":\"GORDON NEIL STUDDERT\",\"description\":\"LOTS 1 & 2 CANCELLING LOT 204 ON D4121\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"CP892529\",\"links\":[\"HT665\",\"HT659\",\"HT480\",\"CP884700\",\"HT420\",\"SP172308\"],\"plan_number_date\":\"CP892529 (1995-05-20)\",\"surveyor\":\"CAPRICORN SURVEY CONSULTANTS PTY LTD\",\"description\":\"LOTS 44 AND 52 CANCELLING LOTS 44 AND 52 ON HT665\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT665\",\"links\":[\"CP892529\",\"CP884700\",\"HT420\",\"HT659\",\"HT480\",\"SP172308\"],\"plan_number_date\":\"HT665 (1990-01-12)\",\"surveyor\":\"DESMOND JAMES MCNEE\",\"description\":\"LOT 44 AND LOT 52; LOT B IN LOT 52\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT420\",\"links\":[\"HT665\",\"CP892529\",\"CP884700\",\"HT659\",\"HT480\",\"SP172308\"],\"plan_number_date\":\"HT420 (1976-06-24)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.39; R.5,156 & 157\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"AP5475\",\"links\":[],\"plan_number_date\":\"AP5475 (2000-08-28)\",\"surveyor\":\"NOT REQUIRED\",\"description\":\"LOT A (PERMIT TO OCCUPY) IN LOT 52 ON CP892529\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"SP104422\",\"links\":[],\"plan_number_date\":\"SP104422 (1999-08-23)\",\"surveyor\":\"PETER MICHAEL RIDDLE\",\"description\":\"LEASE (LOT) C IN LOT 52 ON CP892529\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"SP141270\",\"links\":[],\"plan_number_date\":\"SP141270 (2002-01-25)\",\"surveyor\":\"ALEXANDER ROBERT DAWSON\",\"description\":\"LEASES E AND F IN LOT 52 ON CP892529\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"RP616510\",\"links\":[\"D4121\",\"RP909781\",\"RP608339\",\"RP604486\",\"D4127\",\"D4126\",\"D41213\",\"D41212\",\"SP104777\",\"CP884700\",\"RP604749\",\"RP607254\",\"D4125\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\"],\"plan_number_date\":\"RP616510 (1983-05-12)\",\"surveyor\":\"LINCOLN PARTNERS PTY LTD\",\"description\":\"LOTS 1 & 2 CANCELLING LOT 207 ON D4121\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"SP104777\",\"links\":[\"D4121\",\"RP909781\",\"RP608339\",\"RP604486\",\"D4127\",\"D4126\",\"RP616510\",\"D41213\",\"D41212\",\"CP884700\",\"RP604749\",\"RP607254\",\"D4125\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\"],\"plan_number_date\":\"SP104777 (1998-06-25)\",\"surveyor\":\"ALEXANDER ROBERT DAWSON\",\"description\":\"LOT 5 CANCELLING LOTS 805 & 806 ON D4121\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"H407\",\"links\":[],\"plan_number_date\":\"H407 (1889-03-22)\",\"surveyor\":\"WILLIAM COOKE CLEMENTS\",\"description\":\"S.POR.1\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"RP617039\",\"links\":[\"SP254059\",\"RP616175\",\"HT342\",\"H403\",\"SP152759\",\"RP618487\",\"RP807445\"],\"plan_number_date\":\"RP617039 (1984-01-16)\",\"surveyor\":\"CHARLES RODNEY SCHLENCKER\",\"description\":\"LOTS 1 & 3 CANCELLING LOT 1 ON RP616175\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"SP172308\",\"links\":[\"CP884700\",\"HT665\",\"CP892529\",\"HT420\",\"HT659\",\"HT480\"],\"plan_number_date\":\"SP172308 (2004-08-31)\",\"surveyor\":\"ALEXANDER ROBERT DAWSON\",\"description\":\"LOTS 1 AND 2 CANCELLING LOT 1 ON CP884700\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"CP884700\",\"links\":[\"SP172308\",\"HT665\",\"CP892529\",\"HT420\",\"HT659\",\"HT480\"],\"plan_number_date\":\"CP884700 (1995-06-07)\",\"surveyor\":\"ALEXANDER ROBERT DAWSON\",\"description\":\"LOT 1 CANCELLING LOT 1 ON D41211 & PART OF LOT 52 ON HT665\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"D41211\",\"links\":[\"CP884700\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\",\"HT659\",\"HT480\"],\"plan_number_date\":\"D41211 (1975-04-03)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"ALLOT 1 OF SEC.14\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"SP141268\",\"links\":[\"HT448\",\"HT311\",\"HT230\"],\"plan_number_date\":\"SP141268 (2002-01-03)\",\"surveyor\":\"ALEXANDER ROBERT DAWSON\",\"description\":\"LOT 37 CANCELLING LOT 37 ON HT448 (PART OF USL BEING CLOSED ROAD)\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT448\",\"links\":[\"SP141268\",\"HT311\",\"HT230\"],\"plan_number_date\":\"HT448 (1978-04-11)\",\"surveyor\":\"RODNEY ARTHUR LEGGE\",\"description\":\"POR.37\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT311\",\"links\":[\"HT448\",\"HT230\",\"SP141268\"],\"plan_number_date\":\"HT311 (1972-07-03)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.37\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT230\",\"links\":[\"HT311\",\"HT448\",\"SP141268\"],\"plan_number_date\":\"HT230 (1969-11-03)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.37\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"RP909781\",\"links\":[\"D41212\",\"D4121\",\"RP608339\",\"RP604486\",\"D4127\",\"D4126\",\"RP616510\",\"D41213\",\"SP104777\",\"CP884700\",\"RP604749\",\"RP607254\",\"D4125\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\"],\"plan_number_date\":\"RP909781 (1997-03-26)\",\"surveyor\":\"MCKEAGUES PTY LTD\",\"description\":\"LOTS 1 AND 2 CANCELLING LOT 8 ON D41212\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"D41212\",\"links\":[\"RP909781\",\"D4121\",\"RP608339\",\"RP604486\",\"D4127\",\"D4126\",\"RP616510\",\"D41213\",\"SP104777\",\"CP884700\",\"RP604749\",\"RP607254\",\"D4125\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\"],\"plan_number_date\":\"D41212 (1977-12-05)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"ALLOT 8 OF SEC.1\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT126\",\"links\":[\"HT334\"],\"plan_number_date\":\"HT126 (1945-10-10)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.33-35\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"RP604749\",\"links\":[\"D4121\",\"RP909781\",\"RP608339\",\"RP604486\",\"D4127\",\"D4126\",\"RP616510\",\"D41213\",\"D41212\",\"SP104777\",\"CP884700\",\"RP607254\",\"D4125\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\"],\"plan_number_date\":\"RP604749 (1936-02-24)\",\"surveyor\":\"THOMAS WALKER LAWRENCE ROGERS\",\"description\":\"LOTS 1-2 CANCELLING LOT 203 ON D4121\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT484\",\"links\":[],\"plan_number_date\":\"HT484 (1979-12-13)\",\"surveyor\":\"CHARLES RODNEY SCHLENCKER\",\"description\":\"POR.42\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"RA1624\",\"links\":[],\"plan_number_date\":\"RA1624 (1977-01-11)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"Road (open) in Lot 34 on HT420 CANCELLING TM\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"D4126\",\"links\":[\"D4121\",\"RP909781\",\"RP608339\",\"RP604486\",\"D4127\",\"RP616510\",\"D41213\",\"D41212\",\"SP104777\",\"CP884700\",\"RP604749\",\"RP607254\",\"D4125\",\"SP172308\",\"HT665\",\"CP892529\",\"HT420\"],\"plan_number_date\":\"D4126 (1965-04-28)\",\"surveyor\":\"GORDON NEIL STUDDERT\",\"description\":\"RESURVEY OF ALLOT 2 OF SEC.6 CANCELLING ALLOT 2 OF SEC.6 ON D4121\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"IS246191\",\"links\":[],\"plan_number_date\":\"IS246191 (2012-01-26)\",\"surveyor\":\"JDA CONSULTANTS PTY LTD\",\"description\":\"LOT 27 ON HT489\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"MP39968\",\"links\":[],\"plan_number_date\":\"MP39968 (2012-11-21)\",\"surveyor\":\"FYFE PTY LTD\",\"description\":\"PWL - SUMMIT #2 & 3\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"RP606844\",\"links\":[],\"plan_number_date\":\"RP606844 (1953-06-11)\",\"surveyor\":\"HARRY BACON\",\"description\":\"EMT A IN LOT 1 ON RP606236 AND EMT A IN LOT 9022  ON H4017\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT188\",\"links\":[\"HT7\"],\"plan_number_date\":\"HT188 (1966-04-21)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"POR.13\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT7\",\"links\":[\"HT188\"],\"plan_number_date\":\"HT7 (1903-08-14)\",\"surveyor\":\"CLAUD FRANCIS BLAIN\",\"description\":\"POR.13;R.5&37\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT134\",\"links\":[],\"plan_number_date\":\"HT134 (1951-11-29)\",\"surveyor\":\"VICTOR ERNEST RIETHMULLER\",\"description\":\"RD IN POR.13;RD IN POR.5 PARISH TRYPHINIA\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT135\",\"links\":[],\"plan_number_date\":\"HT135 (1953-04-23)\",\"surveyor\":\"RAY LAMONT\",\"description\":\"RD IN POR.13\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT182\",\"links\":[],\"plan_number_date\":\"HT182 (1965-04-03)\",\"surveyor\":\"BRIAN GEOFFREY MOORE\",\"description\":\"RD IN POR.13\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT206\",\"links\":[],\"plan_number_date\":\"HT206 (1966-12-09)\",\"surveyor\":\"GARNET BRUCE LINCOLN\",\"description\":\"RD IN POR.13;RD IN POR.5 PARISH TRYPHINIA\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT218\",\"links\":[],\"plan_number_date\":\"HT218 (1968-07-26)\",\"surveyor\":\"JAMES FREDERICK HAWKE MURRAY\",\"description\":\"RD IN POR.13\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"MP39967\",\"links\":[],\"plan_number_date\":\"MP39967 (2012-11-20)\",\"surveyor\":\"FYFE PTY LTD\",\"description\":\"PWL - SUMMIT #1\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"IS60376\",\"links\":[],\"plan_number_date\":\"IS60376 (1960-10-25)\",\"surveyor\":\"GORDON NEIL STUDDERT\",\"description\":\"LOT 603 ON D4121\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"SP170607\",\"links\":[\"SP129817\",\"SP170608\",\"HT326\",\"HT82\"],\"plan_number_date\":\"SP170607 (2004-03-30)\",\"surveyor\":\"DTS GROUP QLD PTY LTD\",\"description\":\"LOTS 1,2,4 AND 5 CANCELLING PART OF USL BEING CLOSED ROAD ADJACENT TO LOT 581 ON SP129817\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"SP129817\",\"links\":[\"SP170607\",\"SP170608\",\"HT326\",\"HT82\"],\"plan_number_date\":\"SP129817 (2000-06-21)\",\"surveyor\":\"DTS GROUP QLD PTY LTD\",\"description\":\"LOT 581 (BEING PART OF LOT 1 ON CP825707) CANCELLING LOTS 581 & 603 ON P42537, LOT 49 ON HT612 AND LOTS 2 & 3 ON HT326\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT326\",\"links\":[\"SP129817\",\"HT82\",\"SP170607\",\"SP170608\"],\"plan_number_date\":\"HT326 (1973-05-02)\",\"surveyor\":\"WILLIAM JOHN CHARLES BURVILL\",\"description\":\"LOTS 1-3 & POR.16 (RAILWAY RESUMPTION FROM POR.16 AND ROAD) CANCELLING PART OF POR.16 & ROAD\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT612\",\"links\":[\"SP129817\",\"SP170607\",\"SP170608\",\"HT326\",\"HT82\"],\"plan_number_date\":\"HT612 (1986-10-08)\",\"surveyor\":\"LINCOLN PARTNERS PTY LTD\",\"description\":\"LOT.49\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT82\",\"links\":[\"HT326\",\"SP129817\",\"SP170607\",\"SP170608\"],\"plan_number_date\":\"HT82 (1921-08-02)\",\"surveyor\":\"WILLIAM HENRY FLOWERS\",\"description\":\"POR.16\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"D41210\",\"links\":[],\"plan_number_date\":\"D41210 (1972-11-20)\",\"surveyor\":\"SURVEYOR GENERAL\",\"description\":\"ALLOT 3 OF SEC.12\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"D4124\",\"links\":[],\"plan_number_date\":\"D4124 (1951-12-05)\",\"surveyor\":\"VICTOR ERNEST RIETHMULLER\",\"description\":\"RD IN SEC.12\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"DP218372\",\"links\":[],\"plan_number_date\":\"DP218372 (2009-08-26)\",\"surveyor\":\"ALEXANDER ROBERT DAWSON\",\"description\":\"PLAN OF LOTS 2 & 3 CANCELLING LOT 1 ON SP172308\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"RP606236\",\"links\":[\"H4017\"],\"plan_number_date\":\"RP606236 (1950-04-06)\",\"surveyor\":\"HARRY BACON\",\"description\":\"LOTS 1 & 2 CANCELLING LOT 9024 ON H4017\",\"compiled\":\"No\",\"field_note_flag\":\"true\"},{\"index\":\"HT659\",\"links\":[\"HT665\",\"HT480\",\"CP892529\",\"CP884700\",\"HT420\",\"SP172308\"],\"plan_number_date\":\"HT659 (1988-12-19)\",\"surveyor\":\"DESMOND JAMES MCNEE\",\"description\":\"LOT 44;\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"HT541\",\"links\":[],\"plan_number_date\":\"HT541 (1983-07-25)\",\"surveyor\":\"LINCOLN PARTNERS PTY LTD\",\"description\":\"PART OF THE BOUNDARIES OF POR.44\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"SP170608\",\"links\":[\"SP129817\",\"SP170607\",\"HT326\",\"HT82\"],\"plan_number_date\":\"SP170608 (2004-03-30)\",\"surveyor\":\"DTS GROUP QLD PTY LTD\",\"description\":\"LOTS 3 AND 581 CANCELLING LOT 581 ON SP129817\",\"compiled\":\"No\",\"field_note_flag\":\"false\"},{\"index\":\"D4123\",\"links\":[],\"plan_number_date\":\"D4123 (1901-05-04)\",\"surveyor\":\"CLAUD FRANCIS BLAIN\",\"description\":\"ALLOT 1 OF SEC.9\",\"compiled\":\"No\",\"field_note_flag\":\"true\"}]};



// For MSIE < 9, forget it
function D3notok() {
    document.getElementById('sidepanel').style.visibility = 'hidden';
    var nocontent = document.getElementById('nocontent');
    nocontent.style.visibility = 'visible';
    nocontent.style.pointerEvents = 'all';
    var t = document.getElementsByTagName('body');
    var body = document.getElementsByTagName('body')[0];
    body.style.backgroundImage = "url('movie-network-screenshot-d.png')";
    body.style.backgroundRepeat = "no-repeat";
}

// -------------------------------------------------------------------
// A number of forward declarations. These variables need to be defined since
// they are attached to static code in HTML. But we cannot define them yet
// since they need D3.js stuff. So we put placeholders.


// Highlight a movie in the graph. It is a closure within the d3.json() call.
var selectMovie = undefined;

// Change status of a panel from visible to hidden or viceversa
var toggleDiv = undefined;

// Clear all help boxes and select a movie in network and in movie details panel
var clearAndSelect = undefined;


// The call to set a zoom value -- currently unused
// (zoom is set via standard mouse-based zooming)
var zoomCall = undefined;


// update(root);
// -------------------------------------------------------------------

// Do the stuff -- to be called after D3.js has loaded
function D3ok(linkages) {

    // Some constants
    var WIDTH = 960,
        HEIGHT = 600,
        SHOW_THRESHOLD = 2.5;

    // Variables keeping graph state
    var activeMovie = undefined;
    var currentOffset = { x : 0, y : 0 };
    var currentZoom = 1.0;

    // The D3.js scales
    var xScale = d3.scale.linear()
        .domain([0, WIDTH])
        .range([0, WIDTH]);
    var yScale = d3.scale.linear()
        .domain([0, HEIGHT])
        .range([0, HEIGHT]);
    var zoomScale = d3.scale.linear()
        .domain([1,6])
        .range([1,6])
        .clamp(true);

    /* .......................................................................... */

    // The D3.js force-directed layout
    var force = d3.layout.force()
        .charge(-320)
        .size( [WIDTH, HEIGHT] )
        .linkStrength( function(d,idx) { return d.weight; } );

    // Add to the page the SVG element that will contain the movie network
    var svg = d3.select("#movieNetwork").append("svg:svg")
        .attr('xmlns','http://www.w3.org/2000/svg')
        .attr("width", WIDTH)
        .attr("height", HEIGHT)
        .attr("id","graph")
        .attr("viewBox", "0 0 " + WIDTH + " " + HEIGHT )
        .attr("preserveAspectRatio", "xMidYMid meet");

    // Movie panel: the div into which the movie details info will be written
    movieInfoDiv = d3.select("#movieInfo");

    /* ....................................................................... */

    // Get the current size & offset of the browser's viewport window
    function getViewportSize( w ) {
        var w = w || window;
        if( w.innerWidth != null )
            return { w: w.innerWidth,
                h: w.innerHeight,
                x : w.pageXOffset,
                y : w.pageYOffset };
        var d = w.document;
        if( document.compatMode == "CSS1Compat" )
            return { w: d.documentElement.clientWidth,
                h: d.documentElement.clientHeight,
                x: d.documentElement.scrollLeft,
                y: d.documentElement.scrollTop };
        else
            return { w: d.body.clientWidth,
                h: d.body.clientHeight,
                x: d.body.scrollLeft,
                y: d.body.scrollTop};
    }



    function getQStringParameterByName(name) {
        var match = RegExp('[?&]' + name + '=([^&]*)').exec(window.location.search);
        return match && decodeURIComponent(match[1].replace(/\+/g, ' '));
    }


    /* Change status of a panel from visible to hidden or viceversa
     id: identifier of the div to change
     status: 'on' or 'off'. If not specified, the panel will toggle status
     */
    toggleDiv = function( id, status ) {
        d = d3.select('div#'+id);
        if( status === undefined )
            status = d.attr('class') == 'panel_on' ? 'off' : 'on';
        d.attr( 'class', 'panel_' + status );
        return false;
    }


    /* Clear all help boxes and select a movie in the network and in the
     movie details panel
     */
    clearAndSelect = function (id) {
        toggleDiv('faq','off');
        toggleDiv('help','off');
        selectMovie(id,true);	// we use here the selectMovie() closure
    }


    /* Compose the content for the panel with movie details.
     Parameters: the node data, and the array containing all nodes
     */
    function getMovieInfo( n, nodeArray ) {
        info = '<div id="cover">';

        info += '<div class=t style="float: right">' + n.plan_number_date + '</div>';
        info +=
            '<img src="close.png" class="action" style="top: 0px;" title="close panel" onClick="toggleDiv(\'movieInfo\');"/>' +
            '<img src="target-32.png" class="action" style="top: 280px;" title="center graph on movie" onclick="selectMovie('+n.index+',true);"/>';

        info += '<br/></div><div style="clear: both;">'
        if( n.surveyor )
            info += '<div class=f><span class=l>Surveyor</span>: <span class=g>'
                + n.surveyor + '</span></div>';
        if( n.description )
            info += '<div class=f><span class=l>Description</span>: <span class=d>'
                + n.description + '</span></div>';
        if( n.compiled )
            info += '<div class=f><span class=l>Compiled</span>: <span class=c>'
                + n.compiled + '</span></div>';
        if( n.field_note_flag )
            info += '<div class=f><span class=l>FiledNotFlag</span>: <span class=f>'
                + n.field_note_flag + '</span></div>';
        return info;
    }


    // *************************************************************************

    // d3.json(
    //     json_data,
    //     // function(data) {
        //
            // Declare the variables pointing to the node & link arrays
            var nodeArray = linkages.nodes;
            var linkArray = linkages.links;

            minLinkWeight =
                Math.min.apply( null, linkArray.map( function(n) {return n.weight;} ) );
            maxLinkWeight =
                Math.max.apply( null, linkArray.map( function(n) {return n.weight;} ) );

            // Add the node & link arrays to the layout, and start it
            force
                .nodes(nodeArray)
                .links(linkArray)
                .start();

            // A couple of scales for node radius & edge width
            var node_size = d3.scale.linear()
                .domain([5,10])	// we know score is in this domain
                .range([1,16])
                .clamp(true);
            var edge_width = d3.scale.pow().exponent(8)
                .domain( [minLinkWeight,maxLinkWeight] )
                .range([1,3])
                .clamp(true);

            /* Add drag & zoom behaviours */
            svg.call( d3.behavior.drag()
                .on("drag",dragmove) );
            svg.call( d3.behavior.zoom()
                .x(xScale)
                .y(yScale)
                .scaleExtent([1, 6])
                .on("zoom", doZoom) );

            // ------- Create the elements of the layout (links and nodes) ------

            var networkGraph = svg.append('svg:g').attr('class','grpParent');

            // links: simple lines
            var graphLinks = networkGraph.append('svg:g').attr('class','grp gLinks')
                .selectAll("line")
                .data(linkArray, function(d) {return d.source.id+'-'+d.target.id;} )
                .enter().append("line")
                .style('stroke-width', function(d) { return edge_width(d.weight);} )
                .attr("class", "link");

            // nodes: an SVG circle
            var graphNodes = networkGraph.append('svg:g').attr('class','grp gNodes')
                .selectAll("circle")
                .data( nodeArray, function(d){ return d.id; } )
                .enter().append("svg:circle")
                .attr('id', function(d) { return "c" + d.index; } )
                // .attr('class', function(d) { return 'node level'+d.level;} )
                // .attr('r', function(d) { return node_size(d.score || 3); } )
                .attr('pointer-events', 'all')
                //.on("click", function(d) { highlightGraphNode(d,true,this); } )
                .on("click", function(d) { showMoviePanel(d); } )
                .on("mouseover", function(d) { highlightGraphNode(d,true,this);  } )
                .on("mouseout",  function(d) { highlightGraphNode(d,false,this); } );

            // labels: a group with two SVG text: a title and a shadow (as background)
            var graphLabels = networkGraph.append('svg:g').attr('class','grp gLabel')
                .selectAll("g.plan_number_date")
                .data( nodeArray, function(d){return d.plan_number_date} )
                .enter().append("svg:g")
                .attr('id', function(d) { return "l" + d.index; } )
                .attr('class','plan_number_date');

            shadows = graphLabels.append('svg:text')
                .attr('x','-2em')
                .attr('y','-.3em')
                .attr('pointer-events', 'none') // they go to the circle beneath
                .attr('id', function(d) { return "lb" + d.index; } )
                .attr('class','nshadow')
                .text( function(d) { return d.plan_number_date; } );

            labels = graphLabels.append('svg:text')
                .attr('x','-2em')
                .attr('y','-.3em')
                .attr('pointer-events', 'none') // they go to the circle beneath
                .attr('id', function(d) { return "lf" + d.index; } )
                .attr('class','nplan_number_date')
                .text( function(d) { return d.plan_number_date; } );


            /* --------------------------------------------------------------------- */
            /* Select/unselect a node in the network graph.
             Parameters are:
             - node: data for the node to be changed,
             - on: true/false to show/hide the node
             */
            function highlightGraphNode( node, on )
            {
                //if( d3.event.shiftKey ) on = false; // for debugging

                // If we are to activate a movie, and there's already one active,
                // first switch that one off
                if( on && activeMovie !== undefined ) {
                    highlightGraphNode( nodeArray[activeMovie], false );
                }

                // locate the SVG nodes: circle & label group
                circle = d3.select( '#c' + node.index );
                label  = d3.select( '#l' + node.index );

                // activate/deactivate the node itself
                circle
                    .classed( 'main', on );
                label
                    .classed( 'on', on || currentZoom >= SHOW_THRESHOLD );
                label.selectAll('text')
                    .classed( 'main', on );

                // activate all siblings
                Object(node.links).forEach( function(id) {
                    d3.select("#c"+id).classed( 'sibling', on );
                    label = d3.select('#l'+id);
                    label.classed( 'on', on || currentZoom >= SHOW_THRESHOLD );
                    label.selectAll('text.nplan_number_date')
                        .classed( 'sibling', on );
                } );

                // set the value for the current active movie
                activeMovie = on ? node.index : undefined;
            }


            /* --------------------------------------------------------------------- */
            /* Show the details panel for a movie AND highlight its node in
             the graph. Also called from outside the d3.json context.
             Parameters:
             - new_idx: index of the movie to show
             - doMoveTo: boolean to indicate if the graph should be centered
             on the movie
             */
            selectMovie = function( new_idx, doMoveTo ) {

                // do we want to center the graph on the node?
                doMoveTo = doMoveTo || false;
                if( doMoveTo ) {
                    s = getViewportSize();
                    width  = s.w<WIDTH ? s.w : WIDTH;
                    height = s.h<HEIGHT ? s.h : HEIGHT;
                    offset = { x : s.x + width/2  - nodeArray[new_idx].x*currentZoom,
                        y : s.y + height/2 - nodeArray[new_idx].y*currentZoom };
                    repositionGraph( offset, undefined, 'move' );
                }
                // Now highlight the graph node and show its movie panel
                highlightGraphNode( nodeArray[new_idx], true );
                showMoviePanel( nodeArray[new_idx] );
            }


            /* --------------------------------------------------------------------- */
            /* Show the movie details panel for a given node
             */
            function showMoviePanel( node ) {
                // Fill it and display the panel
                movieInfoDiv
                    .html( getMovieInfo(node,nodeArray) )
                    .attr("class","panel_on");
            }


            /* --------------------------------------------------------------------- */
            /* Move all graph elements to its new positions. Triggered:
             - on node repositioning (as result of a force-directed iteration)
             - on translations (user is panning)
             - on zoom changes (user is zooming)
             - on explicit node highlight (user clicks in a movie panel link)
             Set also the values keeping track of current offset & zoom values
             */
            function repositionGraph( off, z, mode ) {

                // do we want to do a transition?
                var doTr = (mode == 'move');

                // drag: translate to new offset
                if( off !== undefined &&
                    (off.x != currentOffset.x || off.y != currentOffset.y ) ) {
                    g = d3.select('g.grpParent')
                    if( doTr )
                        g = g.transition().duration(500);
                    g.attr("transform", function(d) { return "translate("+
                        off.x+","+off.y+")" } );
                    currentOffset.x = off.x;
                    currentOffset.y = off.y;
                }

                // zoom: get new value of zoom
                if( z === undefined ) {
                    if( mode != 'tick' )
                        return;	// no zoom, no tick, we don't need to go further
                    z = currentZoom;
                }
                else
                    currentZoom = z;

                // move edges
                e = doTr ? graphLinks.transition().duration(500) : graphLinks;
                e
                    .attr("x1", function(d) { return z*(d.source.x); })
                    .attr("y1", function(d) { return z*(d.source.y); })
                    .attr("x2", function(d) { return z*(d.target.x); })
                    .attr("y2", function(d) { return z*(d.target.y); });

                // move nodes
                n = doTr ? graphNodes.transition().duration(500) : graphNodes;
                n
                    .attr("transform", function(d) { return "translate("
                        +z*d.x+","+z*d.y+")" } );
                // move labels
                l = doTr ? graphLabels.transition().duration(500) : graphLabels;
                l
                    .attr("transform", function(d) { return "translate("
                        +z*d.x+","+z*d.y+")" } );
            }


            /* --------------------------------------------------------------------- */
            /* Perform drag
             */
            function dragmove(d) {
                offset = { x : currentOffset.x + d3.event.dx,
                    y : currentOffset.y + d3.event.dy };
                repositionGraph( offset, undefined, 'drag' );
            }


            /* --------------------------------------------------------------------- */
            /* Perform zoom. We do "semantic zoom", not geometric zoom
             * (i.e. nodes do not change size, but get spread out or stretched
             * together as zoom changes)
             */
            function doZoom( increment ) {
                newZoom = increment === undefined ? d3.event.scale
                    : zoomScale(currentZoom+increment);
                if( currentZoom == newZoom )
                    return;	// no zoom change

                // See if we cross the 'show' threshold in either direction
                if( currentZoom<SHOW_THRESHOLD && newZoom>=SHOW_THRESHOLD )
                    svg.selectAll("g.plan_number_date").classed('on',true);
                else if( currentZoom>=SHOW_THRESHOLD && newZoom<SHOW_THRESHOLD )
                    svg.selectAll("g.plan_number_date").classed('on',false);

                // See what is the current graph window size
                s = getViewportSize();
                width  = s.w<WIDTH  ? s.w : WIDTH;
                height = s.h<HEIGHT ? s.h : HEIGHT;

                // Compute the new offset, so that the graph center does not move
                zoomRatio = newZoom/currentZoom;
                newOffset = { x : currentOffset.x*zoomRatio + width/2*(1-zoomRatio),
                    y : currentOffset.y*zoomRatio + height/2*(1-zoomRatio) };

                // Reposition the graph
                repositionGraph( newOffset, newZoom, "zoom" );
            }

            zoomCall = doZoom;	// unused, so far

            /* --------------------------------------------------------------------- */

            /* process events from the force-directed graph */
            force.on("tick", function() {
                repositionGraph(undefined,undefined,'tick');
            });

            /* A small hack to start the graph with a movie pre-selected */
            mid = getQStringParameterByName('id')
            if( mid != null )
                clearAndSelect( mid );
        // });

} // end of D3ok()

var linkages = $('#tree').data('linkages');

// var obj = JSON.parse(linkages);
console.log(typeof(linkages))
// console.log(linkages.hasOwnProperty("nodes"));
console.log(Hash(linkages).nodes)
// D3ok();