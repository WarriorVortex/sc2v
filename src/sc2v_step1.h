/* -----------------------------------------------------------------------------
 *
 *  SystemC to Verilog Translator v0.4
 *  Provided by Universidad Rey Juan Carlos
 *
 * -----------------------------------------------------------------------------
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#ifndef SC2V_STEP_1_H
#define SC2V_STEP_1_H

#include "sglib.h"
#include "lists.h"

#define MAX_NAME_LENGTH 256

/* Functions for defines list*/
DefineNode *InsertDefine(DefineNode *list,char *name);
int IsDefine(DefineNode *list,char *name);

/* Functions for registers list*/
RegNode *InsertReg(RegNode *list, char *name, char *name2);
char *IsReg (RegNode *list,char *name);

/* Functions for structs list*/
StructNode *InsertStruct(StructNode *list, char *name, StructRegNode *reglist);
StructRegNode *InsertStructReg(StructRegNode *list, char *name, int length);
void ShowStructs (StructNode * list);
           
#endif