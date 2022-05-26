/* operators */
typedef struct
{
    int oper;                  /* operator */
    int nops;                  /* number of operands */
    struct nodeTypeTag *op[2]; /* operands (expandable) */
} oprNodeType;

typedef struct nodeTypeTag
{
    int type;
    int kind;
    char *name;
    int scope;
    int isUsed;
    union
    {
        oprNodeType opr;
    };
} nodeType;