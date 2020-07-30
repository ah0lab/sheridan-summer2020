
typedef struct treenode {
    int number;
    struct treenode *left, *right;
} TreeNode;

typedef struct {
    TreeNode *root;
} BinaryTree;

void insert (BinaryTree*, int);
int lookup_and_count (BinaryTree*, int);
TreeNode* newTreeNode (int);