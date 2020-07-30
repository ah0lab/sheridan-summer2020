
typedef struct treenode {
    int number;
    struct treenode *left, *right;
} TreeNode;

typedef struct {
    TreeNode *root;
} BinaryTree;


void insert (BinaryTree*, int);