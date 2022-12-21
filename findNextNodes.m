function nodes = findNextNodes(node,selectedMethod)

nodeWrapper = [];
zeroIndexes = [];% for SFS
oneIndexes = [];% for SBS
count = 0;
switch(selectedMethod)

    case "SFS"
        for i = 1:size(node,2)
            if node(1,i) == 0
                zeroIndexes(1,i) = i;
                count = count + 1;
            end
        end
        index = 1;
        if count ~= 0
            for k = 1:size(zeroIndexes,2)
                if zeroIndexes(1,k) ~= 0
                    m = [0 0 0 0 0 0 0 0];
                    m(1,zeroIndexes(1,k)) = 1;
                    nodeWrapper(index,:) = m + node;
                    index = index + 1;
                end
            end
            nodes = nodeWrapper;
        else
            nodes = node;
        end

    case "SBS"

        for i = 1:size(node,2)
            if node(1,i) == 1
                oneIndexes(1,i) = i;
                count = count + 1;
            end
        end
        index = 1;
        if count ~= 0
            for k = 1:size(oneIndexes,2)
                if oneIndexes(1,k) ~= 0
                    m = [0 0 0 0 0 0 0 0];
                    m(1,oneIndexes(1,k)) = -1;
                    nodeWrapper(index,:) = m + node;
                    index = index + 1;
                end

            end
            nodes = nodeWrapper;
        else
            nodes = node;
        end
end
end