# program to implement bfs algorithm in python

# 1) create a graph
graph = {
    5: [3, 7],
    3: [2, 4],
    7: [8],
    2: [],
    4: [8],
    8: []
}

visited = []
queue = []

to_be_searched_node = 7
queue.append(5)


def bfs(graph, visited, queue, to_be_searched_node):

    while (queue):

        current_node = queue.pop(0)
        visited.append(current_node)

        if (current_node == to_be_searched_node):
            print("Found")
            break

        children = graph[current_node]

        for x in children:
            if (x not in visited):
                queue.append(x)


bfs(graph, visited, queue, to_be_searched_node)
