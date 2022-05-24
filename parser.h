typedef enum
{
    typeCon,
    typeId,
    typeOpr
} nodeEnum;

typedef enum
{
    typeInt,
    typeFloat,
    typeChar,
    typeBoolean
} idEnum;

typedef struct
{
    int value;
} nodeInt;

typedef struct
{
    float value;
} nodeFloat;

typedef struct
{
    char value;
} nodeChar;

typedef struct
{
    int value;
    
} nodeBoolean;

typedef struct
{
    idEnum type;
    char *name;
    union
    {
        nodeInt integer;
        nodeFloat floatNumber;
        nodeChar charcter;
        nodeBoolean boolean;
    };

} idNodeType;

typedef struct
{
    int oper;                  /* operator */
    int nops;                  /* number of operands */
    struct nodeTypeTag *op[1]; /* operands (expandable) */
} oprNodeType;

typedef struct
{
    int value;
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
