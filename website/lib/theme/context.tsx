"use client";

import {createContext, ReactNode, useContext, useEffect, useState} from "react";

export type Theme = "dark" | "light";

type ThemeContextType = {
    theme: Theme;
    setTheme: (theme: Theme) => void;
    toggleTheme: () => void;
};

const ThemeContext = createContext<ThemeContextType | undefined>(undefined);

export function ThemeProvider({children}: { children: ReactNode }) {
    const [theme, setThemeState] = useState<Theme>("dark");
    const [mounted, setMounted] = useState(false);

    useEffect(() => {
        setMounted(true);
        // Check localStorage first
        const stored = localStorage.getItem("preferred-theme") as Theme | null;
        if (stored && (stored === "dark" || stored === "light")) {
            setThemeState(stored);
            return;
        }
        // Check system preference
        if (window.matchMedia("(prefers-color-scheme: light)").matches) {
            setThemeState("light");
        }
    }, []);

    useEffect(() => {
        if (!mounted) return;

        const root = document.documentElement;
        root.classList.remove("dark", "light");
        root.classList.add(theme);

        // Update theme-color meta tag
        const themeColor = theme === "dark" ? "#0f172a" : "#fef9c3";
        const metaThemeColor = document.querySelector('meta[name="theme-color"]');
        if (metaThemeColor) {
            metaThemeColor.setAttribute("content", themeColor);
        }
    }, [theme, mounted]);

    const setTheme = (newTheme: Theme) => {
        setThemeState(newTheme);
        localStorage.setItem("preferred-theme", newTheme);
    };

    const toggleTheme = () => {
        setTheme(theme === "dark" ? "light" : "dark");
    };

    // Prevent flash of wrong theme
    if (!mounted) {
        return <>{children}</>;
    }

    return (
        <ThemeContext.Provider value={{theme, setTheme, toggleTheme}}>
            {children}
        </ThemeContext.Provider>
    );
}

export function useTheme() {
    const context = useContext(ThemeContext);
    // Return a default context during SSR or when ThemeProvider is not available
    if (!context) {
        return {
            theme: "dark" as Theme,
            setTheme: () => {
            },
            toggleTheme: () => {
            },
        };
    }
    return context;
}
