

def postorder(inorder, preorder)
  root = inorder.index(preorder[0])
  length = inorder.length
  postorder(inorder[0..root-1], preorder[1..root+1]) if root != 0
  postorder(inorder[root+1..inorder.length-1], preorder[root+1..preorder.length-1]) if root != length - 1
  @postorder << preorder[0]
end

@postorder = []
inorder = [4, 2, 5, 1, 3, 6]
preorder = [1, 2, 4, 5, 3, 6]
postorder(inorder, preorder)
print @postorder