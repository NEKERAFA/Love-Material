# Extending the library

Mäterial is made to be extensible, so you can create your own components or modules and add to the main library. Also, you can customize the look of the default components and use the theme colours for your own module. In this section we talk about how to do these things starting with an easy templates.

## Adding your own component

In order to create custom componets, Mäterial has a build-in function (see [`material.loadComponents`](https://nekerafa.github.io/Love-Material/modules/material.html#loadComponents)) to load custom componets. This function will load the component as a Lua module (see [`require`](https://www.lua.org/manual/5.1/manual.html#pdf-require) Lua function). The component will have the name of this module, which must return a function that Mäterial will call pasing itself as the first parameter.

The following template shows what it looks like:

```lua
return ( material )

-- Custom Mäterial component
function component (arg, ...)

-- Do something

end

return component

end
```

For create a Mäterial module, instead of returning a function, you can return a table with the collection of components as follows:


```lua
return ( material )

-- Custom Mäterial component 1
function component1 (arg, ...)

-- Do something

end

-- Custom Mäterial component 2
function component2 (arg, ...)

-- Do something

end

-- More components

return {
    ['MyOwnComponent1'] = component1,
    ['MyOwnComponent2'] = component2,
    -- More components
}

end
```

## Customizing the theme

*Work in progress...*
