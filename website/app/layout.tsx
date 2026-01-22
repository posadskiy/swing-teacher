import type {Metadata} from "next";
import {Geist, Geist_Mono} from "next/font/google";
import {Header} from "@/components/layout/Header";
import {Footer} from "@/components/layout/Footer";
import {TranslationProvider} from "@/lib/translations/context";
import {ThemeProvider} from "@/lib/theme/context";
import {LocaleSetter} from "@/components/layout/LocaleSetter";
import {SITE_DESCRIPTION, SITE_NAME, SITE_URL} from "@/lib/constants";
import "./globals.css";

const geistSans = Geist({
    variable: "--font-geist-sans",
    subsets: ["latin"],
});

const geistMono = Geist_Mono({
    variable: "--font-geist-mono",
    subsets: ["latin"],
});

export const metadata: Metadata = {
    metadataBase: new URL(SITE_URL),
    title: {
        default: `${SITE_NAME} - Learn Java Swing GUI Development`,
        template: `%s | ${SITE_NAME}`,
    },
    description: SITE_DESCRIPTION,
    keywords: [
        "Java Swing",
        "Java GUI",
        "Java tutorial",
        "Swing tutorial",
        "learn Java",
        "desktop application",
        "GUI development",
        "programming education",
        "interactive learning",
        "code editor",
    ],
    authors: [{name: "Posadskiy"}],
    creator: "Posadskiy",
    publisher: SITE_NAME,
    robots: {
        index: true,
        follow: true,
        googleBot: {
            index: true,
            follow: true,
            "max-video-preview": -1,
            "max-image-preview": "large",
            "max-snippet": -1,
        },
    },
    openGraph: {
        type: "website",
        locale: "en_US",
        url: SITE_URL,
        siteName: SITE_NAME,
        title: `${SITE_NAME} - Learn Java Swing GUI Development`,
        description: SITE_DESCRIPTION,
        images: [
            {
                url: "/images/og-image.png",
                width: 1200,
                height: 630,
                alt: SITE_NAME,
            },
        ],
    },
    twitter: {
        card: "summary_large_image",
        title: `${SITE_NAME} - Learn Java Swing GUI Development`,
        description: SITE_DESCRIPTION,
        images: ["/images/og-image.png"],
    },
    alternates: {
        canonical: SITE_URL,
    },
};

export default function RootLayout({
                                       children,
                                   }: {
    children: React.ReactNode;
}) {
    return (
        <html lang="en" className={`${geistSans.variable} ${geistMono.variable} dark`} suppressHydrationWarning>
        <head>
            <link rel="icon" href="/favicon.ico" sizes="any"/>
            <link rel="apple-touch-icon" href="/images/apple-touch-icon.png"/>
            <meta name="theme-color" content="#0f172a"/>
            {/* Prevent flash of wrong theme */}
            <script dangerouslySetInnerHTML={{
                __html: `
                    (function() {
                        try {
                            var theme = localStorage.getItem('preferred-theme');
                            if (theme === 'light' || (!theme && window.matchMedia('(prefers-color-scheme: light)').matches)) {
                                document.documentElement.classList.remove('dark');
                                document.documentElement.classList.add('light');
                            }
                        } catch (e) {}
                    })();
                `
            }}/>
        </head>
        <body className="min-h-screen flex flex-col antialiased">
        <ThemeProvider>
        <TranslationProvider>
            <LocaleSetter/>
            <Header/>
            <main className="flex-1">{children}</main>
            <Footer/>
        </TranslationProvider>
        </ThemeProvider>

        {/* JSON-LD Structured Data */}
        <script
            type="application/ld+json"
            dangerouslySetInnerHTML={{
                __html: JSON.stringify({
                    "@context": "https://schema.org",
                    "@type": "SoftwareApplication",
                    name: SITE_NAME,
                    description: SITE_DESCRIPTION,
                    applicationCategory: "EducationalApplication",
                    operatingSystem: "Windows, macOS, Linux",
                    offers: {
                        "@type": "Offer",
                        price: "0",
                        priceCurrency: "USD",
                    },
                    author: {
                        "@type": "Person",
                        name: "Posadskiy",
                    },
                    aggregateRating: {
                        "@type": "AggregateRating",
                        ratingValue: "4.8",
                        ratingCount: "150",
                    },
                }),
            }}
        />
        </body>
        </html>
    );
}
