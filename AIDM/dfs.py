# program to implement dfs in python

graph = {
        5:[3,7],
        3:[2,4],
        7:[8],
        2:[],
        4:[8],
        8:[]
        }

stack = [5]
to_be_searched_node = 7
visited = []


def dfs():

    while(stack):

        current_node = stack.pop()
        visited.append(current_node)

        if(current_node == to_be_searched_node):
            print ("Found")
            break
    
        children = graph[current_node]

        for x in children:
            if(x not in visited):
                stack.append(x)

dfs()