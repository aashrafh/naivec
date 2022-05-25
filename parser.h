typedef enum
{
    typeCon,
    typeId,
    typeOpr
} nodeEnum;

typedef struct
{
    int type;
    char *name;
} idNodeType;

typedef struct
{
    int oper;                  /* operator */
    int nops;                  /* number of operands */
    struct nodeTypeTag *op[1]; /* operands (expandable) */
} oprNodeType;

typedef struct
{
    int type;
    char *name;
} conNodeType;

typedef struct nodeTypeTag
{
    nodeEnum type; /* type of node */
    union
    {
        conNodeType con;
        idNodeType id;
        oprNodeType opr;
    };
} nodeType;
